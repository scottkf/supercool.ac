ProductViewModel = (model) ->
	@sku = model.attributes.sku
	@href = '#' + model.attributes.sku
	@id = model.cid
	@description = model.attributes.info
	# ko.computed(=>
	# 	console.log model.attributes.description 	
	# 	kb.locale_change_observable()
	# 	model.attributes.description)
	@image = if window.navigator.onLine then model.attributes.image else 'img/products/'+@sku+'.png'
	@short = model.attributes.short
	@title = model.attributes.title
	# @title = kb.observable(model, 'title')
	# ko.computed( =>
	#	 kb.locale_change_observable()
	# 	 model.attributes.title)
	@

ComponentViewModel = (model) ->
	@category = model.attributes.category
	@description = ko.computed(=> 	
		kb.locale_change_observable()
		model.attributes.description[kb.locale_manager.getLocale()])
	@href = if model.attributes.href then model.attributes.href else '#' + model.attributes.category + '-modal'
	@name = model.attributes.name
	@id_button = model.attributes.category + '-button'
	@id_text = model.attributes.category + '-text'
	@modal = model.attributes.category + '-modal'
	@shown = model.attributes.shown
	@products = kb.collectionObservable(model.products, {view_model: ProductViewModel})
	# model.products = new Products(@category, kb.locale_manager.localeToURL(kb.locale_manager.getLocale()))
	# model.products.fetch() if @shown
	# @products.collection(model.products)
	model.bind 'change', => 
		model.fetchProducts(kb.locale_manager.localeToURL(kb.locale_manager.getLocale()))
		@products.collection(model.products)
	# product = ko.computed(=>
	# 	kb.locale_change_observable()
	# 	@products.collection(new Products(@category, kb.locale_manager.localeToURL(kb.locale_manager.getLocale())))
	# 	@products.collection().fetch()
	# 	)
	@
	
window.ComponentsViewModel = (components) ->
	@components = kb.collectionObservable(components, {view_model: ComponentViewModel})
	@