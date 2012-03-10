require 'jqvr/javascript_helpers'

module Jqvr
  class ActionView::Helpers::FormBuilder
    def jqvr
      include Jqvr::Javascript::Helpers
      # TODO Fazer primeiro as rules, sem colocar no javascript ainda para poder conferir o resultado
      @object.class.validators.each do |v|
        v.map(&:attributes).first.each do |a|
          # TODO terminar mensagem
          add_rule v.map(&:kind).first, a, "the message"
        end
      end
    end
  end
end