require 'test_helper'

class ValidatorMapTest < ActiveSupport::TestCase
  include Jqvr
  
  test "ValidatorMap deve iniciar aceitando os attributos" do
    vm=ValidatorMap.new :presence,"required:true", [:on]
    assert_equal :presence, vm.kind
    assert_equal "required:true",vm.rule
    assert_equal [:on],vm.options_keys
  end
  
  test "ValidatorMap deve converter a option para array mesmo que passado sem ser array" do
    vm=ValidatorMap.new :presence,"required:true", :on
    assert_equal [:on],vm.options_keys
  end
  
end