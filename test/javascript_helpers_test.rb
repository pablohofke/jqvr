# encoding: utf-8

require 'test_helper'
require 'jqvr/javascript_helpers'

class JavascriptHelpersTest < ActiveSupport::TestCase
  
  include Jqvr::JavascriptHelpers
  
  @attribute="attribute"
  @message="the message"
  
  def rule_output(name,param="true")
    "jQuery.('[name=\"foo[#{@attribute}]\"]').rules('add',{#{name}:#{param},messages:{#{name}:'#{@message}'}});\n"
  end
  
  def new_method_rule_output(name,function,param="true")
    "jQuery.validator.addMethod('#{name}',#{function});\n" +
    rule_output(name)
  end
  
  def rule_to_check(name,params=nil)
    add_rule name, @attribute, @message, params
  end
  
  test "add_rule deve gerar as rules padrões do rails" do
    # acceptance
    assert_equal(rule_output("required"), 
                 rule_to_check(:acceptance))
    # confirmation
    assert_equal(rule_output("equalTo","attribute_confirmation"),
                 rule_to_check(:confirmation))
    # exclusion
    assert_equal(new_method_rule_output("exclusion_in","function(value){return jQuery.inArray(value,['Alto','Médio','Baixo'])==-1}"),
                 rule_to_check(:exclusion, :in => ['Alto','Médio','Baixo']))
    # format with
    assert_equal(new_method_rule_output("format_with","function(value){if(value!=""){return value.match(/[A-Z]/)}else{return true}}"),
                 rule_to_check(:format,:with => /[A-Z]/))
    # format without
    assert_equal(new_method_rule_output("format_without","function(value){if(value!=""){return !value.match(/[A-Z]/)}else{return true}}"),
                 rule_to_check(:format, :without => /[A-Z]/))
    # inclusion
    assert_equal(new_method_rule_output("inclusion_in","function(value){if(value!=""){return jQuery.inArray(value,['Alto','Médio','Baixo'])!=-1}else{return true}}"),
                 rule_to_check(:inclusion, :in => ["Alto","Médio","Baixo"]))
    # length minimum
    assert_equal(rule_output("minlength",3),
                 rule_to_check(:length,:minimum => 3))
     # length maximum
     assert_equal(rule_output("maxlength",5),
                  rule_to_check(:length,:maximum => 5))    
     # length within
     assert_equal(rule_output("rangelength","[3,5]"),
                  rule_to_check(:length,:within => [3,5]))                  
     # length in
     assert_equal(rule_output("rangelength","[3,5]"),
                  rule_to_check(:length,:in => [3,5]))                  
    # numericality
    assert_equal(new_method_rule_output("numericality","function(value){if(value!=""){Number(value.replace(',', '.'))!=NaN}else{return true}}"),
                 rule_to_check(:numericality))
    # numericality only_integer
    assert_equal(rule_output "digits",
                 rule_to_check(:numericality, :only_integer => true))
    # numericality greater_than
    assert_equal(new_method_rule_output("numericality_greater_than","function(value,param){if(value!=''){return value > param}else{return true}}",5),
                 rule_to_check(:numericality, :greater_than => 5))
    # numericality greater_than_or_equal_to
    assert_equal(rule_output("min",5),
                 rule_to_check(:numericality, :greater_than_or_equal_to => 5))    
    # numericality equal_to
    assert_equal(new_method_rule_output("numericality_equal_to","function(value,param){if(value!=''){return value==param}else{return true}}",5),
                 rule_to_check(:numericality, :equal_to => 5))
    # numericality less_than
    assert_equal(new_method_rule_output("numericality_less_than","function(value,param){if(value!=''){return value < param}else{return true}}",5),
                 rule_to_check(:numericality, :less_than => 5))
    # numericality less_than_or_equal_to
    assert_equal(rule_output("max",5),
                 rule_to_check(:numericality, :less_than_or_equal_to => 5))    
    # numericality odd
    assert_equal(new_method_rule_output("numericality_odd","function(value){if(value!=''){return value % 2!=0}else{return true}}",5),
                 rule_to_check(:numericality, :odd => 5))
    # numericality even
    assert_equal(new_method_rule_output("numericality_even","function(value){if(value!=''){return value % 2==0}else{return true}}",5),
                 rule_to_check(:numericality, :even => 5))
    # presence
    assert_equal(rule_output "required", 
                 rule_to_check(:presence))        
  end
  
  
  
end