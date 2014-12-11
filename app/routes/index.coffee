module.exports = (app) ->
  app.get '/', app.HomeController.index

  app.get '/*', (req, res) ->
    res.send 404
