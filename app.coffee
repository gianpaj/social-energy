# module dependencies
express = require 'express'
routes = require './routes'
http = require 'http'
path = require 'path'

# local depencendies
models = require './models'
services = require './services'

app = express()

port = if process.env.NODE_ENV == 'production' then 80 else 3000

app.set 'port', process.env.PORT || port
app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

# all environments
app.configure ->
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

routes.init app
models.init app
services.init app

# development only
if 'development' == app.get('env')
  app.use express.errorHandler()

http.createServer(app).listen app.get('port'), ->
  console.log('Express server listening on port ' + app.get('port'))