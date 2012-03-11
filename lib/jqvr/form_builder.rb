require 'jqvr/javascript_helpers'

module Jqvr
  
  
  
  class ActionView::Helpers::FormBuilder
   include Jqvr::JavascriptHelpers
    
    def jqvr
      rules=""
      @object.class.validators.each do |v|
        v.attributes.each do |a|
          # debugger
          # TODO terminar mensagem
          @method_name=a.to_s
          rules << add_rule(v.kind, a, "the message")
        end
      end
      # output
      "jQuery(function(){
          jQuery('##{ActionController::RecordIdentifier.dom_id(@object, @object.new_record? ? :new : :edit)}').validate();
          #{rules}  
        });"
    end
  
  end
end