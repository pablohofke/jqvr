require 'test_helper'

class JqvrTest < ActiveSupport::TestCase
  
  test "truth" do
    assert_kind_of Module, Jqvr
  end
  
  test 'setup block yields self' do
    setup do |config|
      assert_equal Jqvr, config
    end
  end
  
  # test "map_validator deve incluir o validator_map na array mapped_validators" do
  #   map_validator :presence, "required:true", :on
  #   mapped_validator=mapped_validators.first
  #   assert_equal mapped_validator.kind, :presence
  #   assert_equal mapped_validator.rule,"required:true"
  #   assert_equal mapped_validator.option,:on
  # end
  
end
