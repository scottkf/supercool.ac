$ ->

	window.app = {viewmodels: {}, collections: {}}
	app.collections.components = new Components()
	app.viewmodels.components = new ComponentsViewModel()
	ko.applyBindings(app.viewmodels.components, $('#standard-group')[0])
		

	# Start the app routing
	new AppRouter()
	Backbone.history.start()


	# kb.vmRelease(app.viewmodels)		# Destroy when finished with the view model