$ ->

	window.app = {viewmodels: {}, collections: {}}
	# app.viewmodels.settings = new SettingsViewModel()
	app.collections.components = new Components()
	ko.applyBindings(app.viewmodels, $('#todoapp')[0])
	components = []
	components[] = new Component
		name: 'Evaporator'
		category: 'evaporator'
		description['en']: 'removes heat from vehicle cabin and blows cold air in. Can be expensive to replace often resulting in high labor costs'

	components[] = new Component
		name: 'Accumulator / Receiver Dryer'
		category: 'accumulator'
		description['en']: 'contains desiccant crystals. Primary function is to remove moisture from A/C system. Should be replaced whenever the system is opened'
	components[] = new Component
		name: 'Compressor'
		category: 'compressor'
		description['en']: 'the heart of the A/C system. #1 cause of compressor failure is lack of lubrication'
	components[] = new Component
		name: 'A/C Lines'
		category: 'ac-lines'
		description['en']: 'High Pressure A/C lines'
	components[] = new Component
		name: 'A/C Lines'
		category: 'ac-lines'
		description['en']: 'Low Pressure A/C lines'
		shown: false
	components[] = new Component
		name: 'Condenser'
		category: 'condenser'
		description['en']: 'operates under high pressure and dispenses heat out of A/C system into the atmosphere'
	components[] = new Component
		name: 'Refrigerant'
		category: 'refrigerant'
		description['en']: '(expansion device system) – meters flow of refrigerant into the evaporator. Should be serviced or replaced when system is opened'
	components[] = new Component
		name: 'Orifice / TXV'
		category: 'orifice-tube-txv'
		description['en']: '(orifice tube system) – meters flow of refrigerant into the evaporator. Should be replaced when system is opened.'


	# Start the app routing
	new AppRouter()
	Backbone.history.start()

	# Load the todos
	# app.collections.todos.fetch()

	# kb.vmRelease(app.viewmodels)		# Destroy when finished with the view model