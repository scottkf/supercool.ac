class window.Instruction extends Backbone.Model
	defaults: 
		step: 0
		steps: 7

	next: ->
		@set 'step', (@get('step') + 1) % @get('steps')
		@get('step')
	previous: ->
		@set 'step', @get('step') - 1
		@set 'step', @get('steps')-1 if @get('step') < 0
		@get('step')
