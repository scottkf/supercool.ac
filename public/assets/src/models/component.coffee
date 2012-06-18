class window.Component extends Backbone.Model
	products: new Products
	defaults: 
		category: ''
		description: []
		name: ''
		shown: true
		id: ''
	initialize: ->
		@set 'id':@name
