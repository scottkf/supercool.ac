window.InteriorViewModel = (model) ->
	@model = model
	@label = kb.observable(kb.locale_manager, 'interior')
	@next = -> 
		@model.next()
		@model.get('step')
		@reloadPopover()
	@previous = -> 
		@model.previous()
		@model.get('step')
		@reloadPopover()
	@reloadPopover = ->
		popover = $('.popover.interior')
		popover.attr('data-step', @step())
		popover.find('.popover-content p').html(@label()[@step()])
	@step = kb.observable(@model, 'step')
	@
	# @text = kb.observable(model, 'text')
	# @step = kb.observable(model, 'step')
