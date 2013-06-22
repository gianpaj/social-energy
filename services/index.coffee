emailer = require './emailService'

exports.init = (app) ->
  emailer.init()