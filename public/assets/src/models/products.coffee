class window.Products extends Backbone.Collection
	model: Product
	initialize: (url, locale) ->
		@url = 'http://www.supercool.ac/'+locale+'/products/components-'+url+'/?json&callback=?'