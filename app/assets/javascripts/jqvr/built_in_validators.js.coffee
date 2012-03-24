jQuery ->
  # confirmation
  jQuery.validator.addMethod("confirmation", (value,element,params) ->
    fieldConfirmationName=element.name.substring(0,(element.name.length-1)) + '_confirmation]'
    fieldConfirmationNameSelector = getFieldNameSelector(fieldConfirmationName)
    fieldConfirmation=jQuery(fieldConfirmationNameSelector)[0]
    
    if fieldConfirmation.value isnt ""
      value is fieldConfirmation.value
    else
      true
  )
  
  jQuery('[name$="_confirmation]"]').blur(->
    fieldToConfirm=getFieldToConfirm(@)
    isValid=true
    isOnfocusout=jQuery(this).closest('form').validate().settings.onfocusout
    
    if isOnfocusout
      isValid = jQuery(fieldToConfirm).valid()
      if not isValid
        jQuery(fieldToConfirm).addClass('was_invalid')
  )
  
  jQuery('[name$="_confirmation]"]').keyup(->
    fieldToConfirm= getFieldToConfirm(@)
    parentForm=jQuery(@).closest('form')
    isOnkeyup=jQuery(parentForm).validate().settings.onkeyup
    errorClass=jQuery(parentForm).validate().settings.errorClass
    validClass=jQuery(parentForm).validate().settings.validClass
    
    if isOnkeyup
      # if jQuery(fieldToConfirm).hasClass('was_invalid') or jQuery(fieldToConfirm).hasClass(errorClass) or jQuery(fieldToConfirm).hasClass(validClass)
      if jQuery(fieldToConfirm).hasClass(errorClass)
        jQuery(fieldToConfirm).valid()
  )
  
  getFieldToConfirm= (fieldConfirmation) ->
    fieldToConfirmName= fieldConfirmation.name.substring(0,(fieldConfirmation.name.length-14)) + ']'
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
  # length is
  jQuery.validator.addMethod("lengthIs",(value,element,params) ->
    if value isnt ""
      value.length is params
    else
      true
  )
  # numericality
  jQuery.validator.addMethod("numericality", (value,element,params) ->
    if value isnt ""
      not isNaN(value)
    else
      true
  )
  # numericality greater_than
  jQuery.validator.addMethod("numericalityGreaterThan", (value,element,params) ->
    if value isnt ""
      value > params
    else
      true
  )
  # numericality :equal_to
  jQuery.validator.addMethod("numericalityEqualTo", (value,element,params) ->
    if value isnt ""
      value is params
    else
      true
  )
  # numericality :less_than 
  jQuery.validator.addMethod("numericalityLessThan", (value,element,params) ->
    if value isnt ""
      value < params
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