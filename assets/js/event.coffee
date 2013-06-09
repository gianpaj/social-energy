$ ->
  console.log 'poop'
  # setup snap handlers
  jump '#about', '#about-section'
  jump '#schedule', '#schedule-section'
  jump '#contact', '#contact-section'
  jump '#faq', '#faq-section'

jump = (src, target) ->
  $(src).click -> $.scrollTo $(target).offset().top - 60, 500
