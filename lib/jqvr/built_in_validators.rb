module Jqvr
  # Inclui todos os validator padrões do rails no mapped_validators
  module BuiltInValidators
    
    MappedValidators.add :acceptance, "required:true" 
    MappedValidators.add :confirmation, "confirmation:true" 
    MappedValidators.add :exclusion, "exclusionIn:%{options[:in]}"
    MappedValidators.add :format, "formatWith:%{options[:with]}" 
    MappedValidators.add :format, "formatWithout:%{options[:without]}" 
    MappedValidators.add :inclusion, "inclusionIn:%{options[:in]}" 
    MappedValidators.add :length, "minlength:%{options[:minimum]}" 
    MappedValidators.add :length, "maxlength:%{options[:maximum]}" 
    MappedValidators.add :length, "rangelength:[%{options[:minimum]},%{options[:maximum]}]"
    MappedValidators.add :length, "lengthIs:%{options[:is]}" 
    MappedValidators.add :numericality, "numericality:true" 
    MappedValidators.add :numericality, "digits:true",:only_integer 
    MappedValidators.add :numericality, "numericalityGreaterThan:%{options[:greater_than]}"
    MappedValidators.add :numericality, "min:%{options[:greater_than_or_equal_to]}" 
    MappedValidators.add :numericality, "numericalityEqualTo:%{options[:equal_to]}"
    MappedValidators.add :numericality, "numericalityLessThan:%{options[:less_than]}"
    MappedValidators.add :numericality, "max:%{options[:less_than_or_equal_to]}" 
    MappedValidators.add :numericality, "numericalityOdd:true",:odd
    MappedValidators.add :numericality, "numericalityEven:true",:even
    MappedValidators.add :presence,"required:true"
    # TODO Fazer depois, pois tem ajax
    #:uniqueness
    # TODO Vale a pena fazer validate associated?
    MappedValidators.add :uniqueness,"uniqueness:true",:case_sensitive
  end
end