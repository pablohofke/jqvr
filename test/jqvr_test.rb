require 'test_helper'

class JqvrTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Jqvr
  end
  
  test 'setup block yields self' do
    Jqvr.setup do |config|
      assert_equal Jqvr, config
    end
  end
  
end
