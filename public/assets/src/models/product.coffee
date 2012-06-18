class window.Product extends Backbone.Model
	defaults:
		sku: ''
		title: ''
		short-title: ''
		image: ''
		description: []
	defaults: -> return {created_at: new Date()}
