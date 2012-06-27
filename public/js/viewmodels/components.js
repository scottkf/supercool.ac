// Generated by CoffeeScript 1.3.3
(function() {
  var ComponentViewModel, ProductViewModel;

  ProductViewModel = function(model) {
    this.sku = model.attributes.sku;
    this.href = '#' + model.attributes.sku;
    this.id = model.cid;
    this.description = model.attributes.info;
    this.image = window.navigator.onLine ? model.attributes.image : 'img/products/' + this.sku + '.png';
    this.short = model.attributes.short;
    this.title = model.attributes.title;
    return this;
  };

  ComponentViewModel = function(model) {
    var _this = this;
    this.category = model.attributes.category;
    this.description = ko.computed(function() {
      kb.locale_change_observable();
      return model.attributes.description[kb.locale_manager.getLocale()];
    });
    this.href = model.attributes.href ? model.attributes.href : '#' + model.attributes.category + '-modal';
    this.name = model.attributes.name;
    this.id = model.attributes.id;
    this.id_button = this.id + '-button';
    this.id_text = this.id + '-text';
    this.modal = model.attributes.category + '-modal';
    this.shown = model.attributes.shown;
    this.products = kb.collectionObservable(model.products, {
      view_model: ProductViewModel
    });
    model.bind('change', function() {
      model.fetchProducts(kb.locale_manager.localeToURL(kb.locale_manager.getLocale()));
      return _this.products.collection(model.products);
    });
    return this;
  };

  window.ComponentsViewModel = function(components) {
    this.components = kb.collectionObservable(components, {
      view_model: ComponentViewModel
    });
    return this;
  };

}).call(this);
