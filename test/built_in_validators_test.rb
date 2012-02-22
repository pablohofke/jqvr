# encoding: utf-8

require 'test_helper'

class BuiltInValidatorsTest < ActiveSupport::TestCase
  include Jqvr
  
  test "testa se os validators estão sendo mapeados" do
    BuiltInValidators
    assert_equal :acceptance, MappedValidators.all[0].kind
    assert_equal "required:true", MappedValidators.all[0].rule
    assert_equal :numericality, MappedValidators.all[7].kind
    assert_equal "function(value){Number(value.replace(',', '.'))!=NaN}", MappedValidators.all[7].rule
    assert_equal :numericality, MappedValidators.all[8].kind
    assert_equal "digits:true", MappedValidators.all[8].rule
    assert_equal :only_integer, MappedValidators.all[8].option
  end
  
end