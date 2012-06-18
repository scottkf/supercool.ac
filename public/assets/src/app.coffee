$ ->

	window.app = {viewmodels: {}, collections: {}}
	# app.viewmodels.settings = new SettingsViewModel()
	app.collections.components = new Components()
	ko.applyBindings(app.viewmodels, $('#todoapp')[0])

	# Start the app routing
	new AppRouter()
	Backbone.history.start()

	# Load the todos
	# app.collections.todos.fetch()

	# kb.vmRelease(app.viewmodels)		# Destroy when finished with the view model