class window.Component extends Backbone.Model
	local: true
	url: 'components/'
	products: new Products
	defaults: 
		category: ''
		description: []
		name: ''
		shown: true
