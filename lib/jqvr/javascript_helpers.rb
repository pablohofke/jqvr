require 'jqvr/mapped_validators'
require 'jqvr/built_in_validators'
# require 'action_view/helpers/form_builder'

# class ActionView::Helpers::FormBuilder

module Jqvr
  # Inclui os helpers para gerar o validator
  
module    JavascriptHelpers
  
  
  
    # Adiciona a rule do validator
    # add_rule :presence, :name, "the message"
    def add_rule(kind,attribute,message,option=nil)
      # debugger if kind == :confirmation
      validators=Jqvr::MappedValidators.all
      validator = (validators.select do |v| 
                    if option
                      v.kind == kind && v.option == option.keys.first
                    else
                      v.kind == kind
                    end
                  end).first
      # debugger if kind == :acceptance
      if validator
        if validator.rule.match(/function/)
          if validator.option
            rule_output "#{rule_name(validator)}:#{sanitize_option option[validator.option]}", validator
          end
        else
          if validator.option
            rule_output "#{rule_name(validator)}:#{sanitize_option option[validator.option]}",validator
          else
            rule_output(sanitize_rule(validator, attribute),validator)
          end
        end
      end
    end
      
    private

    def rule_output(rule_and_param,validator)
      "jQuery.('[name=\"#{tag_name}\"]').rules('add',{#{rule_and_param},messages:{#{rule_name validator}:'#{@message}'}});\n"
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
    def tag_name
      "#{@object_name}[#{sanitized_method_name}]"
    end
    
    def sanitized_method_name
      @sanitized_method_name ||= @method_name.sub(/\?$/,"")
    end
      
    # end
      
    
  end
end