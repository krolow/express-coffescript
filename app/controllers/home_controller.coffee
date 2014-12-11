module.exports = (app) ->
	class app.HomeController

		@index: (req, res) ->
			res.json(ok: true)
