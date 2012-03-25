# encoding: utf-8

require 'test_helper'

class RoutesTest < ActionController::TestCase
  test "as rotas de validação devem ser reconhecidas" do
    assert_recognizes({:controller => 'jqvr/validations', :action => 'uniqueness'}, 'jqvr/validations/uniqueness')    
  end
end