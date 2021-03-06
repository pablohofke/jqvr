# require 'action_view'
require 'jqvr/form_builder'
require 'jqvr/engine' if defined?(Rails)

module Jqvr
  
  autoload :ValidatorMap, 'jqvr/validator_map'
  autoload :BuiltInValidators, 'jqvr/built_in_validators'
  autoload :MappedValidators, 'jqvr/mapped_validators'
  autoload :FormBuilder, 'jqvr/form_builder'
  autoload :JavascriptHelpers, 'jqvr/javascript_helpers'
    
  # Permite configurar o Jqvr no initialize
  def self.setup
    yield self
  end
  
end
