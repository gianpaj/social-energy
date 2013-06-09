mongoose = require 'mongoose'
exports.Signup = require('./signupModel').Signup

exports.init = (app) ->
  mongoose.connect 'mongodb://localhost/socialenergy'
  db = mongoose.connection
  db.on 'error', console.error.bind(console, 'connection error:')
  db.on 'open', ->
    console.log 'The energy is flowing in mongodb...'
  db