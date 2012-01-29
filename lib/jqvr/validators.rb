module Jqvr
  # Inclui todos os validator padrões do rails no mapped_validators
  module Validators
    
    Jqvr.map_validator :acceptance, "required:true"
    Jqvr.map_validator :confirmation, "equalTo:%{attribute}_confirmation"
    Jqvr.map_validator :exclusion, "excludes:%{options[:in]}"
    Jqvr.map_validator :format, "matches:%{options[:with]}"
    Jqvr.map_validator :inclusion, "includes:%{in}"
    Jqvr.map_validator :length, "minlength:%{options[:minimum]}"
    Jqvr.map_validator :length, "maxlength:%{options[:maximum]}"
    Jqvr.map_validator :numericality, "function(value){Number(value.replace(',', '.'))!=NaN}"
    Jqvr.map_validator :numericality, "digits:true",:only_integer
    Jqvr.map_validator :numericality, "function(value,element,param){if (value!='') {return value > param} else {return true}}",:greater_than
    Jqvr.map_validator :numericality, "min:%{options[:greater_than_or_equal_to]}"
    Jqvr.map_validator :numericality, "function(value,element,param){if (value!='') {return value==param} else {return true}}",:equal_to
    Jqvr.map_validator :numericality, "function(value,element,param){if (value!='') {return value < param} else {return true}}",:less_than
    Jqvr.map_validator :numericality, "max:%{options[:less_than_or_equal_to]}"
    Jqvr.map_validator :numericality, "function(value,element){if (value!='') {return value % 2!=0} else {return true}}",:odd
    Jqvr.map_validator :numericality, "function(value,element){if (value!='') {return value % 2==0} else {return true}}",:even
    Jqvr.map_validator :presence,"required:true"
    # TODO Fazer depois, pois tem ajax
    # map_validator :uniqueness
  end
end