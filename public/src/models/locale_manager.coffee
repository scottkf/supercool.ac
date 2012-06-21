# Localization
class LocaleManager
  constructor: (locale_identifier, @translations_by_locale) ->
    @setLocale(locale_identifier) if locale_identifier

  get: (string_id, parameters) ->
    return '' if not string_id
    culture_map = @translations_by_locale[@locale_identifier] if @locale_identifier
    return '' if not culture_map
    string = if culture_map.hasOwnProperty(string_id) then culture_map[string_id] else ''
    return string if arguments.length == 1
    return Knockback.toFormattedString.apply(null, [string].concat(Array.prototype.slice.call(arguments, 1)))

  getLocale: -> return @locale_identifier
  setLocale: (locale_identifier) ->
    @locale_identifier = locale_identifier
    return if !window.Backbone
    @trigger('change', @)
    model.trigger('change') for model in window.app.viewmodels.components.components.collection().models
    # window.app.viewmodels.components.components.collection().fetch()
  # culture_map = @translations_by_locale[@locale_identifier]
    # return if not culture_map
    # @trigger("change:#{key}", value) for key, value of culture_map
  getLocales: ->
    locales = []
    locales.push(string_id) for string_id, value of @translations_by_locale
    return locales

  localeToURL: (locale) ->
    locale_parts = locale.split('-')
    return locale_parts[0]
  
  getLocaleURL: ->
    @localeToURL(@getLocale())

  localeToLabel: (locale) ->
    locale_parts = locale.split('-')
    return locale_parts[locale_parts.length-1].toUpperCase()

#######################################
# Mix in Backbone.Events so callers can subscribe
#######################################
_.extend(LocaleManager.prototype, Backbone.Events)

#######################################
# Set up strings
#######################################
throw new Error("Please include Knockback before the Locale Manager") unless kb

kb.locale_manager = new LocaleManager(null, {
  'en-US':
    example: ''
  'fr-FR':
    example: ''
  'it-IT':
    example: ''
  'de-DE':
    example: ''
  'ja':
    example: ''
  'pt-PT':
      example: ''
  'es-ES':
      example: ''
  'zh-CN':
    example: ''


})
