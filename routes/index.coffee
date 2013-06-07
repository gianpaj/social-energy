
index = (req, res) ->
  res.render 'index', title: 'hello'

exports.init = (app) ->
  app.get '/', index