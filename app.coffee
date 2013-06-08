# module dependencies
express = require 'express'
routes = require './routes'
http = require 'http'
path = require 'path'

# local depencendies
models = require './models'

app = express()

# all environments
app.configure ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.favicon( __dirname + '/public/favicon.ico')
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser('ricarious omnibus underwater')
  app.use express.session({'appleby on the rocks'})
  app.use app.router
  app.use require('connect-assets')()
  app.use require('stylus')()
  app.use(express.static(path.join(__dirname, 'public')))

# initialize our router
routes.init app

# initialize models
models.init app

# development only
if 'development' == app.get('env')
  app.use express.errorHandler()

http.createServer(app).listen app.get('port'), ->
  console.log('Express server listening on port ' + app.get('port'))