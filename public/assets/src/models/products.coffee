class window.Products extends Backbone.Collection
	model: Product
	# use local storage if we're not online
	local: -> 
		!window.navigator.onLine
	initialize: (url, locale) ->
		@url = 'http://www.supercool.ac/'+locale+'/products/components-'+url+'/?json&callback=?'