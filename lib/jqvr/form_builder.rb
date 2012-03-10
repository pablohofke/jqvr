require 'jqvr/javascript_helpers'

module Jqvr
  
  
  
  class ActionView::Helpers::FormBuilder
   include Jqvr::JavascriptHelpers
    
    def jqvr
      output=""
      # TODO Fazer primeiro as rules, sem colocar no javascript ainda para poder conferir o resultado
      @object.class.validators.each do |v|
        v.attributes.each do |a|
          # debugger
          # TODO terminar mensagem
          @method_name=a.to_s
          output << add_rule(v.kind, a, "the message")
        end
      end
      output
    end
  
  end
end