module Jqvr
  
  autoload :ValidatorMap, 'jqvr/validator_map'
  autoload :BuiltInValidators, 'jqvr/built_in_validators'
  autoload :MappedValidators, 'jqvr/mapped_validators'
    
  # Permite configurar o Jqvr no initialize
  def self.setup
    yield self
  end
  
end
