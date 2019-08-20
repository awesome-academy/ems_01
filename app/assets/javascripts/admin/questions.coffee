$(document).on "turbolinks:load", ->
  $('form').on 'click', '.remove_record', (event) ->
    $(this).prev('input[type=hidden]').val '1'
    $(this).closest('ul').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    regexp = undefined
    time = undefined
    time = (new Date).getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('.fields').append $(this).data('fields').replace(regexp, time)
    if $('.question-question-type').val() == '1'
      $('.fields').find('input[class=correct_answer]:last').attr 'type', 'checkbox'
    event.preventDefault()

  $('.question-question-type').change ->
    if @value == '1'
      $('input[type=radio]').attr 'type', 'checkbox'
    else
      $('input[type=checkbox]').prop 'checked', false
      $('input[type=checkbox]').attr 'type', 'radio'

  $(document).on 'click', '.correct_answer', ->
    if $(this).val() == 'true'
      if $('.question-question-type').val() == '0'
        if $('input[type=radio]:checked').length > 1
          $('input[type=radio]').prop 'checked', false
          return $(this).prop('checked', true)
    return

  $(document).on 'click', '#create-new-question', ->
    if $('.question-question-type').val() == '0'
      if $('input[type=radio]:checked').length == 0
        alert 'Please specific a correct answer for question'
        return event.preventDefault()
    else if $('input[type=checkbox]:checked').length < 2
      alert 'Please specific at least 2 correct answers for question'
      return event.preventDefault()
    return
  return
