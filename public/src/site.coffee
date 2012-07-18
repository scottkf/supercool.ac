$ ->

	$('a[rel="popover"]').popover({
		template: '<div class="popover car"><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>'
	});
	$('a[rel="instruction"]').popover
		template: '<div class="popover interior" data-step="0"><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p data-bind="text: interior.label()[interior.step()]"></p></div></div></div>'
		# trigger: 'manual'
	$('.modal').modal({
		backdrop:false,
		show:false,
	})
	cursor_shown = false
	$('#leak-text').on 'touchstart', (e) =>
		if cursor_shown == true
			$($('#leak-text').attr('href')).modal('show')
		cursor_shown = true
		e.stopPropagation()
		$('#uv-light').css('display', 'block')
		$('#uv-light').css('opacity', '1')
		$('#leak-image').css('opacity', '1')
	$('#leak-text').on 'click', (e) =>
		if cursor_shown == true
			$($('#leak-text').attr('href')).modal('show')
		cursor_shown = true
		e.stopPropagation()
		$('body').css('cursor', 'url(/img/uv-light.png) 30 100, default')
		$('a').css('cursor', 'url(/img/uv-light.png) 30 100, pointer')
	$('body').on 'click', =>
		cursor_shown = false
		$('body').css('cursor', '')
		$('a').css('cursor', '')
		$('#leak-image').css('opacity', '0')
		$('#uv-light').css('opacity', '0')
		$('#uv-light').css('display', 'none')


	$('#leak-button').on 'hover',
		() =>
			if cursor_shown
				if $('#leak-image').css('opacity') == '0'
				    $('#leak-image').css('opacity', '1')
				else
				    $('#leak-image').css('opacity', '0')
			    return
	# $('body').on 'touchmove',
	# 	() =>
	# 		if cursor_shown
	# 			$('#leak-image').css('opacity', '1')
				# $('#leak-image').toggle()
	# $('body').on 'touchend',
	# 	() =>
	# 		if cursor_shown
	# 		    $('#leak-image').css('opacity', '0')
	# 			$('#uv-light').css('opacity', '0')
	# 			$('#uv-light').css('display', 'none')
				# $('#leak-image').toggle()
	document.body.addEventListener 'touchmove', (event) ->
		event.preventDefault()

	window.effects = 
		smoke:
			shape: 'circle'
			velocity: new Vector({y: -0.45})
			xVariance: 10
			yVariance: 15
			spawnSpeed: 1
			generations: 100000
			maxParticles: 500
			size: 15
			sizeVariance: 10
			life: 350
			lifeVariance: 50
			direction: 0
			directionVariance: 80
			color: '#ccc'
			opacity: 1
			onDraw: (p) ->
				p.opacity = 0.251 - (p.age / p.life) * 0.25
	window.onload = ->
		canvas = $('#particle_canvas')[0]
		if canvas
			window.particles = new ParticleCanvas(canvas, {x: 500})
			particles.update(effects.smoke)
			particles.start()

	timer = null
	time = 5000
	$('#hybrid-button').on 'click', ->
		$('#car').attr('src', 'img/hybrid-car.jpg')
		app.viewmodels.components.components.collection().models[1].set('category', 'hybrid-compressor')
		$('a[rel]').popover('hide')
		clearInterval(timer)
	$('#standard-button').on 'click', ->
		$('#car').attr('src', 'img/standard-car.jpg')
		app.viewmodels.components.components.collection().models[1].set('category', 'compressor')
		$('a[rel]').popover('hide')
		clearInterval(timer)
	$('#interior-button').on 'click', ->
		clearInterval(timer)
		$('a[rel=popover]').popover('hide')
		$('.modal').modal('hide')
		timer = setInterval(->
					app.viewmodels.interior.next()
				,time)
		$('a[rel=instruction]').popover('show')
	$('#content').on 'click', 'i', () ->
		switch $(this).attr('class')
			when 'icon-stop'
				clearInterval(timer)
				$(this).attr('class', 'icon-play')
			when 'icon-play'
				$(this).attr('class', 'icon-stop')
				timer = setInterval(->
							app.viewmodels.interior.next()
						,time)
			else 
				if $(this).attr('class') == 'icon-forward'
					app.viewmodels.interior.next()
				else
					app.viewmodels.interior.previous()
				clearInterval(timer)
				if $('#slideshow-buttons i.icon-stop').length > 0
					timer = setInterval(->
								app.viewmodels.interior.next()
							,time)
	$('.modal').live 'show', ->
		if (!$(this).hasClass('in'))
			$('.modal').modal('hide')			
	$('#vehicle-toggle button').on 'click', ->
		$('.vehicle-group').hide();
		target = $(this).attr('data-target');
		$('#' + target).show();
	$('.modal').draggable();