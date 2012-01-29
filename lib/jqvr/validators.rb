module Jqvr
  # Inclui todos os validator padrões do rails no mapped_validators
  module Validators
    map_validator :acceptance, "required:true"
    map_validator :confirmation, "equalTo:%{attribute}_confirmation"
    map_validator :exclusion, "excludes:%{options[:in]}"
    map_validator :format, "matches:%{options[:with]}"
    map_validator :inclusion, "includes:%{in}"
    map_validator :length, "minlength:%{options[:minimum]}"
    map_validator :length, "maxlength:%{options[:maximum]}"
    map_validator :numericality, "function(value){Number(value.replace(',', '.'))!=NaN}"
    map_validator :numericality, "digts:true",:only_integer
    map_validator :numericality, "function(value,element,param){if (value!='') {return value > param} else {return true}}",:greater_than
    map_validator :numericality, "min:%{options[:greater_than_or_equal_to]}"
    map_validator :numericality, "function(value,element,param){if (value!='') {return value==param} else {return true}}",:equal_to
    map_validator :numericality, "function(value,element,param){if (value!='') {return value < param} else {return true}}",:less_than
    map_validator :numericality, "max:%{options[:less_than_or_equal_to]}"
    map_validator :numericality, "function(value,element){if (value!='') {return value % 2!=0} else {return true}}",:odd
    map_validator :numericality, "function(value,element){if (value!='') {return value % 2==0} else {return true}}",:even
    map_validator :presence,"required:true"
    # TODO Fazer depois, pois tem ajax
    # map_validator :uniqueness
  end
end