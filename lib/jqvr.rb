module Jqvr
  
  autoload :DefaultValidatorsMaps,  'jqvr/default_validators_maps'
  
  
  # Mapeia os validators com as rules do jqv
  # map_validator[:presence]="required"
  mattr_accessor :map_validator
  @@map_validator={}
  
  # Permite configurar o Jqvr no initialize
  def self.setup
    yield self
  end
  
end
