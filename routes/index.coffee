models = require '../models'

index = (req, res) ->
  res.render 'event', title: 'Social Energy'

signup = (req, res) ->
  email = req.param 'email'
  su = new models.Signup email: email
  su.save (err) ->
    return res.json 400, err: err if err
    res.json result: 'success'

exports.init = (app) ->
  app.get '/', index
  app.post '/signup', signup