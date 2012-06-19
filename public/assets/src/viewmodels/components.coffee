window.ComponentsViewModel = () ->
	@href = 'url'
	@components = []
	@components.push new Component
		name: 'Evaporator'
		category: 'evaporator'
		description: 'removes heat from vehicle cabin and blows cold air in. Can be expensive to replace often resulting in high labor costs'

	@components.push new Component
		name: 'Accumulator / Receiver Dryer'
		category: 'accumulator'
		description: 'contains desiccant crystals. Primary function is to remove moisture from A/C system. Should be replaced whenever the system is opened'
	@components.push new Component
		name: 'Compressor'
		category: 'compressor'
		description: 'the heart of the A/C system. #1 cause of compressor failure is lack of lubrication'
	@components.push new Component
		name: 'A/C Lines'
		category: 'ac-lines'
		description: 'High Pressure A/C lines'
	@components.push new Component
		name: 'A/C Lines'
		category: 'ac-lines'
		description: 'Low Pressure A/C lines'
		shown: false
	@components.push new Component
		name: 'Condenser'
		category: 'condenser'
		description: 'operates under high pressure and dispenses heat out of A/C system into the atmosphere'
	@components.push new Component
		name: 'Refrigerant'
		category: 'refrigerant'
		description: '(expansion device system) – meters flow of refrigerant into the evaporator. Should be serviced or replaced when system is opened'
	@components.push new Component
		name: 'Orifice / TXV'
		category: 'orifice-tube-txv'
		description: '(orifice tube system) – meters flow of refrigerant into the evaporator. Should be replaced when system is opened.'	