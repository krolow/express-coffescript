express = require 'express'
http = require 'http'
app = express()
morgan = require 'morgan'
bodyParser = require 'body-parser'
methodOverride = require 'method-override'

require("#{__dirname}/../bootstrap/boot")(app)

port = process.env.PORT || 3000

if process.argv.indexOf('-p') >= 0
  port = process.argv[process.argv.indxeOf('-p') + 1]

app.set 'port', port
app.use morgan('combined')
app.use bodyParser.urlencoded()
app.use bodyParser.json()
app.use methodOverride('_method')
app.use methodOverride('X-HTTP-Method-Override')

require("#{__dirname}/routes")(app)

env = process.env.NODE_ENV || 'development';

if env is 'development'
   app.use require('errorhandler')()

require("#{__dirname}/routes")(app)

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get 'port'} in #{app.settings.env} mode"
