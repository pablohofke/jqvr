module Jqvr
  # Representa um validator mapeado
  class ValidatorMap
  
    attr_accessor :kind, :rule, :options_keys
    
    def initialize(kind=nil, rule=nil, options_keys=nil)
      @kind=kind if kind
      @rule=rule if rule
      if options_keys
        if options_keys.is_a?(Array)
          @options_keys=options_keys
        else
          @options_keys=Array(options_keys)
        end
      end
    end
    
  end
end