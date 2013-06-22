models = require '../models'
emailer = require '../services/emailService'

async = require 'async'

index = (req, res) ->
  res.render 'event', title: 'Social Energy'

signup = (req, res) ->
  email = req.param 'email'

  jobs = [
    (cb) ->
      su = new models.Signup email: email
      su.save cb
    (cb) ->
      emailer.subscribe email, cb
  ]

  async.parallel jobs, (err) ->
    if err
      # if mongodb returns E11000 duplicate key error index
      if err.code == 11000
        res.json result: 'duplicate-email'
      else
        return res.json err: err
    else
      res.json result: 'success'

exports.init = (app) ->
  app.get '/', index
  app.post '/signup', signup