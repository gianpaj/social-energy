$ ->
  console.log 'poop'
  # setup snap handlers
  jump '#about', '#about-section'
  jump '#schedule', '#schedule-section'
  jump '#contact', '#contact-section'
  jump '#faq', '#faq-section'

  $('#signup-btn').click ->
    $('#signup-error').removeClass('success').removeClass('error')
  email = $('#signup-input').val()
    $.ajax
      url: '/signup'
      type: 'POST'
      data:
        email: email
      success: (data) ->
        $('#signup-input').text('')
        if data.result == 'duplicate-email'
          $('#signup-error').addClass('success').text('We already have you in the system. Thanks for signing up (again) :)')
        else
        $('#signup-error').addClass('success').text('Thanks! We will let you know when everything is ready to go!')
      error: ->
        $('#signup-error').addClass('error').text('There was a problem sending your email! Try back in a little while.')

jump = (src, target) ->
  $(src).click -> $.scrollTo $(target).offset().top - 60, 500


