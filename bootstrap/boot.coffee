module.exports = (app) ->
  # Helpers
  app.loader = require "#{__dirname}/loader"

  # Controllers
  app.loader.autoload "#{__dirname}/../app/controllers", app

  # Models
  app.loader.autoload "#{__dirname}/../app/models", app

  # Services
  app.loader.autoload "#{__dirname}/../app/services", app
