
index = (req, res) ->
  res.render 'event', title: 'hello'

exports.init = (app) ->
  app.get '/', index