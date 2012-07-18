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
    app.viewmodels.interior.reloadPopover()
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
    interior: 
      0: 'Start engine'
      1: 'With doors and windows closed, turn A/C on'
      2: 'Set controls to recirculate with fan on maximum settings'
      3: 'Shake can and place on the front floor of the passenger side in vehicle'
      4: 'Activate can and immediately exit vehicle and close door'
      5: 'Allow 10 minutes for products to recirculate (can discharges in 2.5 minutes)'
      6: 'Open all doors with vehicle and A/C still running, allow vehicle interior to vent for an additional 10 to 15 minutes'
  'fr-FR':
    interior:
      0: 'Démarrer le moteur'
      1: 'Enclencher l\'air conditionne en laissant les portes et les fenetres fermees'
      2: 'Mettre le ventilateur sur position maximale et enclencher le bouton activant la circulation interieure de l\'air conditionne'
      3: 'Secouer l\'atomiseur et placer le sur le sol, cote passager a l\'interieur du vehicule'
      4: 'Activer l\'atomiseur et immediatement sortir du vehicule et fermer les portes'
      5: 'Laisser agir pendant 10 minutes (l\'atomiseur se decharge en 2.5 minutes)'
      6: 'Ouvrir toutes les portes en maintenant l\'air conditionne et le moteur allume pendant 10 a 15 minutes supplementaires'
  'it-IT':
    interior:
      0: 'Avviare il motore'
      1: 'Con porte e finestre chiuse, Attiva aria condizionata On'
      2: 'Impostare i controlli a ri-circolare con ventola impostazione max'
      3: 'Agitare e posizionare sul pavimento davanti lato passeggero nel veicolo'
      4: 'Attivare può e uscire immediatamente dal veicolo e chiudere la porta'
      5: 'Attendere 10 minuti per il prodotto di circolare (scarichi non può in 2,5 minuti)'
      6: 'Aprite tutte le porte e con il veicolo e aria condizionata ancora in esecuzione, consentono interno del veicolo per sfogare per un ulteriore 10 - 15 minuti'
  'de-DE':
    interior:
      0: 'Starten Sie den Motor'
      1: 'Mit Türen und Fenster geschlossen, Turn On Klimaanlage'
      2: 'Stellen Kontrollen mit Lüfter auf max Einstellung rezirkulieren'
      3: 'Schütteln kann und platzieren Sie auf der Vorderseite Etage Beifahrerseite im Fahrzeug'
      4: 'Aktivieren kann und Fahrzeug sofort verlassen und Tür schließen'
      5: 'Warten Sie 10 Minuten für die Produktentwicklung zu zirkulieren (können Entladungen in 2,5 Minuten)'
      6: 'Öffnen Sie alle Türen und mit Fahrzeug-und Klimaanlage noch läuft, erlauben Fahrzeuginnenraum für eine zusätzliche Entlüftung 10 - 15 Minuten'
  'ja':
    interior:
      0: 'エンジンの起動'
      1: 'ドアや窓を閉じた状態で、上でエアコンを回し'
      2: '最大の設定にファンを使用して再循環するためのコントロールを設定します。'
      3: '缶を振ると、車両の助手席側の前面床に置く'
      4: 'ことができますをアクティブにし、直ちに車両を閉じ、ドアを終了する'
      5: '2.5分でできる放電）製品の10分を循環させる'
      6: 'すべてのドアを開き、車両とエアコンがまだ実行中で、車内は、追加の10から15分間通気することができます'
  'pt-PT':
    interior:
      0: 'Ligue o motor'
      1: 'Com portas e janelas fechadas, Turn On Ar condicionado'
      2: 'Definir controles para voltar a circular com ventilador na configuração máxima'
      3: 'Agite pode e coloque no chão frente do lado do passageiro no veículo'
      4: 'Ative pode e imediatamente sair do veículo e feche a porta'
      5: 'Permitir que 10 minutos para o produto a circular (descargas pode, em 3 minutos)'
      6: 'Abra todas as portas e com veículo e condicionamento de ar continua a correr, permitir que o interior do veículo para ventilar para um adicional de 10 a 15 minutos'
  'es-ES':
    interior:
      0: 'Arranque del motor'
      1: 'Con puertas y ventanas cerradas, Turn aire acondicionado en'
      2: 'Establecer controles para volver a circular con ventilador en el ajuste máximo'
      3: 'Agite la lata y colocarlo en el suelo delante de lado del pasajero en el vehículo'
      4: 'Activar e inmediatamente puede salir del vehículo y cierre la puerta'
      5: 'Espere 10 minutos para que el producto circule (descargas pueden en 2.5 minutos)'
      6: 'Abra todas las puertas y con aire acondicionado del vehículo y todavía en funcionamiento, permitirá dar rienda suelta a interior del vehículo por un período adicional de 10 - 15 minutos'
  'zh-CN':
    interior:
      0: '起动发动机'
      1: '与门窗紧闭，开启空调'
      2: '设置控制重新分发与最大设定风扇'
      3: '给车辆和乘客侧前方的地板上一摇地方'
      4: '激活并立即退出车辆和关门'
      5: '允许10分钟的产品流通（在3分钟内可以出院）'
      6: '打开所有的门，并仍在运行的汽车和空调，让汽车内饰发泄额外的10至15分钟'


})
