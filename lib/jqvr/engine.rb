require 'jqvr'
require 'rails'

module Jqvr
  class Engine < Rails::Engine
    engine_name :jqvr
    isolate_namespace Jqvr
  end
end