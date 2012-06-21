class window.AppRouter extends Backbone.Router
	routes:
		"sync": "sync"
		"": ""

	sync: ->
		window.app.viewmodels.settings.syncing(true)
		for locale in kb.locale_manager.getLocales()
			model.fetchProducts(kb.locale_manager.localeToURL(locale)) for model in window.app.viewmodels.components.components.collection().models