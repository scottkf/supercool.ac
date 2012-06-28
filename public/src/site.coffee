$ ->
	$('a[rel="popover"]').popover({
		template: '<div class="popover"><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>'
	});
	$('.modal').modal({
		backdrop:false,
		show:false,
	})
	$('#hybrid-button').on 'click', ->
		$('#car').attr('src', 'img/hybrid-car.jpg')
		app.viewmodels.components.components.collection().models[1].set('category', 'hybrid-compressor')
	$('#standard-button').on 'click', ->
		$('#car').attr('src', 'img/standard-car.jpg')
		app.viewmodels.components.components.collection().models[1].set('category', 'compressor')
	$('.modal').live 'show', ->
		if (!$(this).hasClass('in'))
			$('.modal').modal('hide')			
	$('#vehicle-toggle button').on 'click', ->
		$('.vehicle-group').hide();
		target = $(this).attr('data-target');
		$('#' + target).show();
	$('.modal').draggable();