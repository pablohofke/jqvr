module Jqvr
  # Inclui todos os validator padrões do rails no mapped_validators
  module BuiltInValidators
    
    MappedValidators.add :acceptance, "required:true"
    MappedValidators.add :confirmation, "equalTo:%{attribute}_confirmation"
    MappedValidators.add :exclusion, "excludes:%{options[:in]}"
    MappedValidators.add :format, "matches:%{options[:with]}"
    MappedValidators.add :inclusion, "includes:%{in}"
    MappedValidators.add :length, "minlength:%{options[:minimum]}"
    MappedValidators.add :length, "maxlength:%{options[:maximum]}"
    MappedValidators.add :numericality, "function(value){Number(value.replace(',', '.'))!=NaN}"
    MappedValidators.add :numericality, "digits:true",:only_integer
    MappedValidators.add :numericality, "function(value,element,param){if (value!='') {return value > param} else {return true}}",:greater_than
    MappedValidators.add :numericality, "min:%{options[:greater_than_or_equal_to]}"
    MappedValidators.add :numericality, "function(value,element,param){if (value!='') {return value==param} else {return true}}",:equal_to
    MappedValidators.add :numericality, "function(value,element,param){if (value!='') {return value < param} else {return true}}",:less_than
    MappedValidators.add :numericality, "max:%{options[:less_than_or_equal_to]}"
    MappedValidators.add :numericality, "function(value,element){if (value!='') {return value % 2!=0} else {return true}}",:odd
    MappedValidators.add :numericality, "function(value,element){if (value!='') {return value % 2==0} else {return true}}",:even
    MappedValidators.add :presence,"required:true"
    # TODO Fazer depois, pois tem ajax
    # map_validator :uniqueness
  end
end