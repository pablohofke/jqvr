jQuery ->
  # confirmation
  jQuery.validator.addMethod("confirmation", (value,element,params) ->
    fieldConfirmationNameSelector = getFieldNameSelector(element.name + '_confirmation')
    fieldConfirmation=jQuery(fieldConfirmationNameSelector)[0]
    
    if fieldConfirmation.value isnt ""
      value is fieldConfirmation.value
    else
      true
  )
  
  jQuery('[name$="_confirmation"]').blur(->
    fieldToConfirm=getFieldToConfirm(@)
    isValid=true
    
    isValid = jQuery(fieldToConfirm).valid()
    if not isValid
      jQuery(fieldToConfirm).addClass('was_invalid')
  )
  
  jQuery('[name$="_confirmation"]').keyup(->
    fieldToConfirm= getFieldToConfirm(@)
    
    if jQuery(fieldToConfirm).hasClass('was_invalid')
      jQuery(fieldToConfirm).valid()
  )
  
  getFieldToConfirm= (fieldConfirmation) ->
    fieldToConfirmName= fieldConfirmation.name.substring(0,(fieldConfirmation.name.length-13))
    fieldToConfirmNameSelector=getFieldNameSelector(fieldToConfirmName)
    
    jQuery(fieldToConfirmNameSelector)
    
  getFieldNameSelector=(fieldToConfirmName) ->
    '[name="' + fieldToConfirmName + '"]'
  
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
  jQuery.validator.addMethod("inclusionIn", (value,element,params) ->
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