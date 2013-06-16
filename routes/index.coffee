models = require '../models'

index = (req, res) ->
  res.render 'event', title: 'Social Energy'

signup = (req, res) ->
  email = req.param 'email'
  su = new models.Signup email: email
  su.save (err) ->
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