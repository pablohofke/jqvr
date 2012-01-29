module Jqvr
  module MappedValidators
    
    mattr_reader :all
    
    def self.add(kind,rule,option=nil)
      @@all=[] if @@all.blank?
      option=extract_rule_option rule unless option
      vm=ValidatorMap.new kind, rule, option
      @@all << vm
    end
    
    def self.extract_rule_option(rule)
      if (option=rule.match(/options\[:(\w*)\]/))
        option[1].to_sym
      end
    end
    
  end
end