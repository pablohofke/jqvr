# encoding: utf-8

require 'test_helper'

class RoutesTest < ActionController::TestCase
  test "as rotas de validação devem ser reconhecidas" do
    assert_recognizes({:controller => 'validations', :action => 'uniqueness'}, 'validations/uniqueness')    
  end
end