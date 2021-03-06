# encoding: utf-8

require 'test_helper'
require 'jqvr/javascript_helpers'

class JavascriptHelpersTest < ActiveSupport::TestCase
  
  include Jqvr::JavascriptHelpers
  
  def setup
    @attribute="the_attribute"
    @message="the message"
    @method_name=@attribute
    @object_name='foo'
  end
  
  def expected_rule(name,param="true")
    "jQuery('[name=\"foo[#{@attribute}]\"]').rules('add',{#{name}:#{param},messages:{#{name}:'#{@message}'}});\n"
  end
  
  def rule_to_check(name,params=nil)
    add_rule name, @attribute, @message, params
  end
  
  
  test "add_rule deve gerar as rules padrões do rails" do
    # acceptance
    assert_equal(expected_rule("required"), 
                 rule_to_check(:acceptance))
    # confirmation
    assert_equal(expected_rule("confirmation"),
                 rule_to_check(:confirmation))
    # exclusion
    assert_equal(expected_rule("exclusionIn","[\"Alto\",\"Médio\",\"Baixo\"]"),
                 rule_to_check(:exclusion, :in => ["Alto","Médio","Baixo"]))
    # format with
    assert_equal(expected_rule("formatWith","/[A-Z]/"),
                 rule_to_check(:format,:with => /[A-Z]/))
    # format without
    assert_equal(expected_rule("formatWithout","/[A-Z]/"),
                 rule_to_check(:format, :without => /[A-Z]/))
    # inclusion
    assert_equal(expected_rule("inclusionIn","[\"Alto\",\"Médio\",\"Baixo\"]"),
                 rule_to_check(:inclusion, :in => ["Alto","Médio","Baixo"]))
    # length minimum
    assert_equal(expected_rule("minlength",3),
                 rule_to_check(:length,:minimum => 3))
     # length maximum
     assert_equal(expected_rule("maxlength",5),
                  rule_to_check(:length,:maximum => 5))    
     # length within or in
     assert_equal(expected_rule("rangelength","[3,5]"),
                  rule_to_check(:length,{:minimum => 3,:maximum => 5}))  
     # length is
     assert_equal(expected_rule("lengthIs","5"),
                  rule_to_check(:length,:is => 5))                              
    # numericality
    assert_equal(expected_rule("numericality"),
                 rule_to_check(:numericality))
    # numericality only_integer
    assert_equal(expected_rule("digits"),
                 rule_to_check(:numericality, :only_integer => true))
    # numericality greater_than
    assert_equal(expected_rule("numericalityGreaterThan",5),
                 rule_to_check(:numericality,:greater_than => 5))
    # numericality greater_than_or_equal_to
    assert_equal(expected_rule("min",5),
                 rule_to_check(:numericality, :greater_than_or_equal_to => 5))    
    # numericality equal_to
    assert_equal(expected_rule("numericalityEqualTo",5),
                 rule_to_check(:numericality, :equal_to => 5))
    # numericality less_than
    assert_equal(expected_rule("numericalityLessThan",5),
                 rule_to_check(:numericality, :less_than => 5))
    # numericality less_than_or_equal_to
    assert_equal(expected_rule("max",5),
                 rule_to_check(:numericality, :less_than_or_equal_to => 5))    
    # numericality odd
    assert_equal(expected_rule("numericalityOdd"),
                 rule_to_check(:numericality,:odd => true))
    # numericality even
    assert_equal(expected_rule("numericalityEven"),
                 rule_to_check(:numericality,:even => true))
    # presence
    assert_equal(expected_rule("required"), 
                 rule_to_check(:presence)) 
     # uniqueness
     assert_equal(expected_rule("uniqueness"), 
                  rule_to_check(:uniqueness,:case_sensitive=>true))       
  end

  
end