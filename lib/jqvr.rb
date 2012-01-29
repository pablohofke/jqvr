require 'jqvr/validator_map'

module Jqvr
  
  autoload :ValidatorMap, 'jqvr/validator_map'
  autoload :Validators, 'jqvr/validators'
  
  # Mapeia os validators com as rules do jqv
  # map_validator[:presence]="required:true"
  mattr_reader :mapped_validators
  # @@mapped_validators=[]
  
  def self.map_validator(kind,rule,option=nil)
    @@mapped_validators=[] if @@mapped_validators.blank?
    vm=ValidatorMap.new kind, rule, option
    @@mapped_validators << vm
  end
  
  def teste
    "sucesso"
  end
  
  # Permite configurar o Jqvr no initialize
  def self.setup
    yield self
  end
  
end
