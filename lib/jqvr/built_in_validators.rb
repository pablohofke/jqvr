module Jqvr
  # Inclui todos os validator padrões do rails no mapped_validators
  module BuiltInValidators
    
    # TODO Usando esses como base para criar add_rule e os testes
    MappedValidators.add :acceptance, "required:true" #ok
    MappedValidators.add :confirmation, "equalTo:%{attribute}_confirmation" #ok
    MappedValidators.add :exclusion, "function(value){return jQuery.inArray(value,element,params)==-1}", :in #ok
    MappedValidators.add :format, "function(value){if(value!=""){return value.match(%{options[:with]})}else{return true}}" #ok
    MappedValidators.add :format, "function(value){if(value!=""){return !value.match(%{options[:without]})}else{return true}}" #ok
    MappedValidators.add :inclusion, "function(value){if(value!=""){return jQuery.inArray(value,%{options[:in]})!=-1}else{return true}}" #ok
    MappedValidators.add :length, "minlength:%{options[:minimum]}" #ok
    MappedValidators.add :length, "maxlength:%{options[:maximum]}" #ok
    MappedValidators.add :length, "rangelength:[%{options[:minimum]},%{options[:maximum]}]", :within #ok
    MappedValidators.add :length, "rangelength:[%{options[:minimum]},%{options[:maximum]}]", :in #ok
    MappedValidators.add :numericality, "function(value){if(value!=""){Number(value.replace(',', '.'))!=NaN}else{return true}}" #ok
    MappedValidators.add :numericality, "digits:true",:only_integer #ok
    MappedValidators.add :numericality, "function(value,param){if(value!=''){return value > param}else{return true}}", :greater_then #ok
    MappedValidators.add :numericality, "min:%{options[:greater_than_or_equal_to]}" #ok
    MappedValidators.add :numericality, "function(value,param){if(value!=''){return value==param}else{return true}}",:equal_to #ok
    MappedValidators.add :numericality, "function(value,param){if(value!=''){return value < param}else{return true}}",:less_than #ok
    MappedValidators.add :numericality, "max:%{options[:less_than_or_equal_to]}" #ok
    MappedValidators.add :numericality, "function(value){if(value!=''){return value % 2!=0}else{return true}}",:odd
    MappedValidators.add :numericality, "function(value){if(value!=''){return value % 2==0}else{return true}}",:even
    MappedValidators.add :presence,"required:true"
    # TODO Fazer depois, pois tem ajax
    # map_validator :uniqueness
  end
end