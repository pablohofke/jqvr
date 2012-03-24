# encoding: utf-8

require 'test_helper'

class BuiltInValidatorsTest < ActiveSupport::TestCase
  include Jqvr
  
  test "testa se os validators estão sendo mapeados" do
    BuiltInValidators
    assert_equal :acceptance, MappedValidators.all[0].kind
    assert_equal "required:true", MappedValidators.all[0].rule
    assert_equal [],MappedValidators.all[0].options_keys
    assert_equal :length, MappedValidators.all[7].kind
    assert_equal "maxlength:%{options[:maximum]}", MappedValidators.all[7].rule
    assert_equal [:maximum], MappedValidators.all[7].options_keys
    assert_equal :length, MappedValidators.all[8].kind
    assert_equal "rangelength:[%{options[:minimum]},%{options[:maximum]}]", MappedValidators.all[8].rule
    assert_equal [:minimum,:maximum], MappedValidators.all[8].options_keys
  end
  
end