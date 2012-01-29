module Jqvr
  class ValidatorMap
  
    attr_accessor :kind, :rule, :option
    
    def initialize(kind=nil, rule=nil, option=nil)
      @kind=kind if kind
      @rule=rule if rule
      @option=option if option
    end
    
    
    
  end
end