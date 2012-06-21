class window.Component extends Backbone.Model
	local: true
	url: 'components/'
	products: new Products
	defaults: 
		category: ''
		description: []
		name: ''
		shown: true

	fetchProducts: (locale) ->
		@products = new Products(@attributes.category, locale)
		@products.fetch() if @get('shown')