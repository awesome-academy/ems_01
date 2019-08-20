$(document).on "turbolinks:load", ->
  $('#exam_questions').change ->
    $('#exam_score').val ''
    $('#exam-total-score').val ($('#exam_questions').val() *
          parseFloat($('#score_each_question').val(), 10)).toFixed(2)
    if $('#exam-total-score').val() == "NaN" or $('#exam-total-score').val() == "0"
      $('#exam-total-score').val ''
    if $(this).val() == ''
      $(this).next().show()
      $(this).next().html('Required field')
      $(this).prev().css 'color', 'red'
    else if Number.isInteger(parseFloat($(this).val(), 10)) == false
      $(this).val ''
      $(this).next().show()
      $(this).next().html('Integer only (in range 1 to 1000)')
      $(this).prev().css 'color', 'red'
    else if $(this).val() > 0
      if $(this).val() > 1000
        $(this).next().show()
        $(this).next().html('Less than or equal to 1000')
        $(this).prev().css 'color', 'red'
      else
        $(this).next().hide()
        $(this).prev().css 'color', 'black'
    else
      $(this).next().show()
      $(this).next().html('Greater than 0')
      $(this).prev().css 'color', 'red'
    return

  $('#score_each_question').change ->
    $('#exam_score').val ''
    $('#exam-total-score').val ($('#exam_questions').val() *
          parseFloat($('#score_each_question').val(), 10)).toFixed(2)
    if $('#exam-total-score').val() == "NaN" or $('#exam-total-score').val() == "0"
      $('#exam-total-score').val ''
    if $('#exam_questions').val() == ''
      $(this).val ''
      $('#exam_questions').next().show()
      $('#exam_questions').next().html('Fill out this field first')
      $('#exam_questions').prev().css 'color', 'red'
    else if $(this).val() == ''
      $(this).next().show()
      $(this).next().html('Required field')
      $(this).prev().css 'color', 'red'
    else if $.isNumeric($(this).val()) == false
      $(this).val ''
      $('#exam-total-score').val ''
      $('#exam_score').val ''
      $('#exam_score').attr('placeholder', '')
      $(this).next().show()
      $(this).next().html('Number only (in range 1 to 1000)')
      $(this).prev().css 'color', 'red'
    else if $(this).val() > 0
      if $(this).val() > 1000
        $(this).next().show()
        $(this).next().html('Less than or equal to 1000')
        $(this).prev().css 'color', 'red'
      else
        $(this).next().hide()
        $(this).prev().css 'color', 'black'
    else
      $(this).next().show()
      $(this).next().html('Greater than 0')
      $(this).prev().css 'color', 'red'
    return

  $('#exam_score').change ->
    if $('#exam_questions').val() == ''
      $(this).val ''
      $('#exam_questions').next().show()
      $('#exam_questions').next().html('Fill out this field first')
      $('#exam_questions').prev().css 'color', 'red'
    else if $(this).val() == ''
      $(this).next().show()
      $(this).next().html('Required field')
      $(this).prev().css 'color', 'red'
    else if $.isNumeric($(this).val()) == false
      $(this).val ''
      $(this).next().show()
      $(this).next().html('Number only (greater than 0, less than total score)')
      $(this).prev().css 'color', 'red'
    else if $(this).val() > 0
      if $(this).val() > parseFloat($('#exam-total-score').val(), 10)
        $(this).next().show()
        $(this).next().html('Less than or equal to total score')
        $(this).prev().css 'color', 'red'
      else
        $(this).next().hide()
        $(this).prev().css 'color', 'black'
    else
      $(this).next().show()
      $(this).next().html('Greater than 0')
      $(this).prev().css 'color', 'red'
    return

  $('#exam_limited_time').change ->
    if $(this).val() == ''
      $(this).next().show()
      $(this).next().html('Required field')
      $(this).prev().css 'color', 'red'
    else if Number.isInteger(parseFloat($(this).val(), 10)) == false
      $(this).val ''
      $(this).next().show()
      $(this).next().html('Integer only (in range 5 to 1000)')
      $(this).prev().css 'color', 'red'
    else if $(this).val() > 5
      if $(this).val() > 1000
        $(this).next().show()
        $(this).next().html('Less than or equal to 1000')
        $(this).prev().css 'color', 'red'
      else
        $(this).next().hide()
        $(this).prev().css 'color', 'black'
    else
      $(this).next().show()
      $(this).next().html('Greater than 5')
      $(this).prev().css 'color', 'red'
    return

  $('#btn-create-exam').click ->
    $('input.exam-input-value').each (index, value) ->
      if $(this).val() == ''
        $(this).next().show()
        $(this).next().html 'Required field'
        $(this).prev().css 'color', 'red'
        event.preventDefault()
      return
    if $('form').find('div[style*="display: block;"]').length
      event.preventDefault()
    return

  return
