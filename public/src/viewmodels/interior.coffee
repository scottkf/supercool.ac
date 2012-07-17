window.InteriorViewModel = (model) ->
	@labels = kb.observables(kb.locale_manager, interior: {})
