require 'jqvr/validator_map'

module Jqvr
  module MappedValidators
    
    mattr_reader :all
    
    # "Mapeia" os validators
    # MappedValidators.add :presence,"required:true"
    # MappedValidators.add :numericality, "digits:true",:only_integer
    # MappedValidators.add :numericality, "min:%{options[:greater_than_or_equal_to]}"
    # TODO refatorar option para virar option_key ou option_keys
    def self.add(kind,rule,options_keys=nil)
      @@all=[] if @@all.blank?
      options_keys=extract_rule_options_keys rule unless options_keys
      if !options_keys.is_a?(Array)
        options_keys=Array(options_keys)
      end
      vm=ValidatorMap.new kind, rule, options_keys
      @@all << vm
    end
    
    # Extrai a option quando passada dentro da rule
    # MappedValidators.add :numericality, "min:%{options[:greater_than_or_equal_to]}"
    def self.extract_rule_options_keys(rule)
      options_keys=rule.scan(/options\[:(\w*)\]/).flatten.map{|o| o.to_sym}
      if options_keys.any?
        # if options_keys.size == 1
        #           options_keys.first
        #         else
          options_keys
        # end
      end
    end
  end
end