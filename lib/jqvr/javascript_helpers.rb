require 'jqvr/mapped_validators'
require 'jqvr/built_in_validators'

module Jqvr
  # Inclui os helpers para gerar o validator
  class JavascriptHelpers < ActionView::Helpers::FormBuilder
    
    
    
    # Adiciona a rule do validator
    # add_rule :presence, :name, "the message"
    def add_rule(kind,attribute,message,option=nil)
      validators=Jqvr::MappedValidators.all
      validators.select! {|v| v.kind == kind && v.option == option}
      if (validator=validators.first)
        "jQuery.('[name=\"tag_name\"]').rules('add',{#{validator.rule},messages:{#{rule_name}:'#{@message}'}});\n"
      end
    end
      
    private
    
    def rule_name()
      if rule.match(/function/)
        output="#{validator.kind.to_s}"
        validator.options.each do |o|
          output<< "_#{o.to_s}"
        end
      else
        output=rule.match(/w*/)
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
      
      
      
    
  end
end