module Jqvr
  module MappedValidators
    
    mattr_reader :all
    
    # "Mapeia" os validators
    # MappedValidators.add :presence,"required:true"
    # MappedValidators.add :numericality, "digits:true",:only_integer
    # MappedValidators.add :numericality, "min:%{options[:greater_than_or_equal_to]}"
    # TODO refatorar option para virar option_key ou option_keys
    def self.add(kind,rule,option=nil)
      @@all=[] if @@all.blank?
      option=extract_rule_option rule unless option
      vm=ValidatorMap.new kind, rule, option
      @@all << vm
    end
    
    # Extrai a option quando passada dentro da rule
    # MappedValidators.add :numericality, "min:%{options[:greater_than_or_equal_to]}"
    def self.extract_rule_option(rule)
      if (option=rule.match(/options\[:(\w*)\]/))
        option[1].to_sym
      end
    end
    
  end
end