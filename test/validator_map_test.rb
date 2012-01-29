require 'test_helper'

class ValidatorMapTest < ActiveSupport::TestCase
  include Jqvr
  
  test "ValidatorMap deve iniciar aceitando os attributos" do
    vm=ValidatorMap.new :presence,"required:true", :on
    assert_equal :presence, vm.kind
    assert_equal "required:true",vm.rule
    assert_equal :on,vm.option
  end
  
end