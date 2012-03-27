# encoding: utf-8

require 'test_helper'

class Jqvr::ValidationsControllerTest < ActionController::TestCase
  
  # @controller = ValidationController
  
  test "uniqueness get" do
    get :uniqueness
    assert_response :success
  end
end