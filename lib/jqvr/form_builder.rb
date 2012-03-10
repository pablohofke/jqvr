require 'jqvr/javascript_helpers'

module Jqvr
  class ActionView::Helpers::FormBuilder
    def jqvr
      # include Jqvr::JavascriptHelpers
      # TODO Fazer primeiro as rules, sem colocar no javascript ainda para poder conferir o resultado
      @object.class.validators.each do |v|
        v.attributes.each do |a|
          # TODO terminar mensagem
          add_rule v.kind, a, "the message"
        end
      end
    end
  end
end