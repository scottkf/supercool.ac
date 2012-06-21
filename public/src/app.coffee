$ ->

	components = []
	components.push new Component
		id: 'evaporator'
		name: 'Evaporator'
		category: 'evaporator'
		description: 
			'en-US': 'removes heat from vehicle cabin and blows cold air in. Can be expensive to replace often resulting in high labor costs'
			'es-ES': 'elimina el calor de la cabina del vehículo y el aire sopla frío in puede ser costosa para sustituir a menudo resulta en altos costos laborales'
	
	components.push new Component
		id: 'accumulator'
		name: 'Accumulator / Receiver Dryer'
		category: 'accumulator'
		description: 
			'en-US':	'contains desiccant crystals. Primary function is to remove moisture from A/C system. Should be replaced whenever the system is opened'
	
	components.push new Component
		id: 'compressor'
		name: 'Compressor'
		category: 'compressor'
		description:
			'en-US': 'the heart of the A/C system. #1 cause of compressor failure is lack of lubrication'
	
	components.push new Component
		id: 'high-pressure-lines'
		name: 'A/C Lines'
		category: 'lines'
		href: '#ac-lines-modal'
		description:
			'en-US': 'High Pressure A/C lines'
		shown: false
	
	components.push new Component
		id: 'low-pressure-lines'
		name: 'A/C Lines'
		category: 'ac-lines'
		description:
			'en-US': 'Low Pressure A/C lines'
	
	components.push new Component
		id: 'condenser'
		name: 'Condenser'
		category: 'condenser'
		description:
			'en-US': 'operates under high pressure and dispenses heat out of A/C system into the atmosphere'
	
	components.push new Component
		id: 'refrigerant'
		name: 'Refrigerant'
		category: 'refrigerant'
		description:
			'en-US': '(expansion device system) – meters flow of refrigerant into the evaporator. Should be serviced or replaced when system is opened'
	
	components.push new Component
		id: 'orifice-txv'
		name: 'Orifice / TXV'
		category: 'orifice-tube-txv'
		description:
			'en-US': '(orifice tube system) – meters flow of refrigerant into the evaporator. Should be replaced when system is opened.'
	
	component.save() for component in components

	kb.locale_change_observable = kb.triggeredObservable(kb.locale_manager, 'change') 

	window.app = {viewmodels: {}, collections: {}}
	app.collections.components = new Components()
	app.viewmodels.components = new ComponentsViewModel(app.collections.components)
	app.viewmodels.settings = new SettingsViewModel(kb.locale_manager.getLocales())

	ko.applyBindings(app.viewmodels, $('body')[0])
		
	app.collections.components.fetch()
	kb.locale_manager.setLocale('en-US')


	# Start the app routing
	app.router = new AppRouter()
	Backbone.history.start()


	# kb.utils.release(app.viewmodels)		# Destroy when finished with the view model