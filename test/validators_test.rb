require 'test_helper'

class ValidatorsTest < ActiveSupport::TestCase
  
  test "testa se os validators estão sendo mapeados" do
    Jqvr::Validators
    assert_equal :acceptance, Jqvr.mapped_validators[0].kind
    assert_equal "required:true", Jqvr.mapped_validators[0].rule
    assert_equal :numericality, Jqvr.mapped_validators[7].kind
    assert_equal "function(value){Number(value.replace(',', '.'))!=NaN}", Jqvr.mapped_validators[7].rule
    assert_equal :numericality, Jqvr.mapped_validators[8].kind
    assert_equal "digits:true", Jqvr.mapped_validators[8].rule
    assert_equal :only_integer, Jqvr.mapped_validators[8].option
  end
  
end