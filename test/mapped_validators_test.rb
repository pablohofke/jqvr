# encoding: utf-8

require 'test_helper'
require 'jqvr/mapped_validators'

class MappedValidatorsTest < ActiveSupport::TestCase

  include Jqvr
  
  def setup
    MappedValidators.all.clear
  end
  
  # add
  test "add deve adicionar os validators" do
    MappedValidators.add :presence, "required:true"
    map=MappedValidators.all.first
    assert_equal :presence, map.kind 
    assert_equal "required:true", map.rule 
  end
  
  test "add deve passar a option quando explícita" do
    MappedValidators.add :numericality, "digits:true",:only_integer
    map=MappedValidators.all.first
    assert_equal :numericality, map.kind
    assert_equal "digits:true", map.rule
    assert_equal :only_integer, map.option 
  end
  
  test "add deve converter as options que estão na rule para options explícitas" do
    MappedValidators.add :length, "minlength:%{options[:minimum]}"
    map=MappedValidators.all.first
    assert_equal :length, map.kind
    assert_equal "minlength:%{options[:minimum]}", map.rule
    assert_equal :minimum, map.option
  end
  
end