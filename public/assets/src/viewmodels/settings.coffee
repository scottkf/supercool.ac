# EXTENSIONS: Localization
SettingLanguageOptionViewModel = (locale) ->
	@id = locale
	@label = kb.locale_manager.localeToLabel(locale)
	@active = ko.computed(=>
		kb.locale_change_observable()
		locale == kb.locale_manager.getLocale())
	@setLanguage = ->
		kb.locale_manager.setLocale(this.id)
	@


window.SettingsViewModel = (locales) ->
	# EXTENSIONS: Language settings
	@language_options = _.map(locales, (locale) -> return new SettingLanguageOptionViewModel(locale))
	@current_language = ko.observable(kb.locale_manager.getLocale())
	@selected_language = ko.computed(
		read: => return @current_language()  # used to create a dependency
		write: (new_locale) => kb.locale_manager.setLocale(new_locale); @current_language(new_locale)
	)

	@