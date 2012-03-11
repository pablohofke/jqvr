jQuery ->
  # exclusion
  jQuery.validator.addMethod("exclusionIn", (value,element,params) ->
    jQuery.inArray(value, params)==-1
  )
  # format with
  jQuery.validator.addMethod("formatWith", (value,element,params) ->
    if value isnt ""
      value.match(params)
    else
      true
  )
  # format without
  jQuery.validator.addMethod("formatWithout", (value,element,params) ->
    if value isnt ""
      not value.match(params)
    else
      true
  )
  # inclusion
  jQuery.validator.addMethod("inclusion", (value,element,params) ->
    if value isnt ""
      jQuery.inArray(value,params) isnt -1
    else
      true
  )
  # numericality
  jQuery.validator.addMethod("numericality", (value,element,params) ->
    if value isnt ""
      Number(value.replace(',', '.'))!=NaN
    else
      true
  )
  # numericality greater_than
  jQuery.validator.addMethod("numericalityGreaterThan", (value,element,params) ->
    if value isnt ""
      value > param
    else
      true
  )
  # numericality :equal_to
  jQuery.validator.addMethod("numericalityEqualTo", (value,element,params) ->
    if value isnt ""
      value is param
    else
      true
  )
  # numericality :less_than 
  jQuery.validator.addMethod("numericalityLessThan", (value,element,params) ->
    if value isnt ""
      value < param
    else
      true
  )
  # numericality :odd 
  jQuery.validator.addMethod("numericalityOdd", (value,element,params) ->
    if value isnt ""
      value % 2 isnt 0
    else
      true
  )
  # numericality :even 
  jQuery.validator.addMethod("numericalityEven", (value,element,params) ->
    if value isnt ""
      value % 2 is 0
    else
      true
  )