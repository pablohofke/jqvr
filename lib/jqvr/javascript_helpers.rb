require 'jqvr/mapped_validators'
require 'jqvr/built_in_validators'
# require 'action_view/helpers/form_builder'

# class ActionView::Helpers::FormBuilder

module Jqvr
  # Inclui os helpers para gerar o validator
  
module    JavascriptHelpers
  
    # TODO Refatorar o código, pode ser muiiito mais limpo
  
    # Adiciona a rule do validator
    # add_rule :presence, :name, "the message"
    def add_rule(kind,attribute,message,option=nil)
      Rails.logger.debug "k: #{kind} a: #{attribute} m: #{message} o:#{option}"
      # debugger # if kind == :exclusion
      # TODO hergh!!!
      @message=message
      validators=Jqvr::MappedValidators.all
      validator = retrieve_mapped_validator kind, option
      # debugger if kind == :acceptance
      # TODO Dá para fazer esses ifs menos DRY?
      if validator
        if validator.rule.match(/function/)
          if validator.options_keys
            rule_output "#{rule_name(validator)}:#{sanitize_option option[validator.options_keys]}", validator,attribute
          else
            rule_output "#{rule_name(validator)}:true", validator,attribute
          end
        else
          if validator.options_keys
            rule_output "#{rule_name(validator)}:#{sanitize_option option[validator.options_keys]}",validator,attribute
          else
            rule_output(sanitize_rule(validator, attribute),validator,attribute)
          end
        end
      end
    end
      
    private

    def retrieve_mapped_validator(kind,option)
      validators=Jqvr::MappedValidators.all
      (validators.select do |v| 
          if option
            if kind != :acceptance
              v.kind == kind && v.options_keys == option.keys.first
            else
              v.kind == kind
            end
          else
            v.kind == kind
          end
        end).first
    end

    def rule_output(rule_and_param,validator,attribute)
      "jQuery('[name=\"#{tag_name attribute}\"]').rules('add',{#{rule_and_param},messages:{#{rule_name validator}:'#{@message}'}});\n"
    end

    def rule_name(validator)
      # debugger
      if validator.rule.match(/function/)
        output= validator.kind.to_s.downcase + validator.option.to_s.camelize
      else
        output=validator.rule.match(/\w*/)
      end
     output
    end
    
    def sanitize_rule(validator,attribute)
      output=validator.rule
      if output.include?("%{attribute}")
        output.gsub! /%{attribute}/,attribute.to_s
      end
      if output.include?("%{model}")
        output.gsub! /%{model}/,@object_name
      end
      output
    end
    
    def sanitize_option(option)
      output=option
      if option.is_a?(Regexp)
        output="/#{option.source}/"
      elsif option.is_a?(Range)
        output="[#{option.first},#{option.last}]"
      end
      output
    end
    
    # Totalmente copiado de actionpack/lib/action_view/helpers/form_helper.rb, pois lá o método é private
    def tag_name(attribute)
      "#{@object_name}[#{attribute.to_s.sub(/\?$/,"")}]"
    end
    
    def sanitized_method_name
      @sanitized_method_name ||= @method_name.sub(/\?$/,"")
    end
      
    # end
      
    
  end
end