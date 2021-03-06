// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Component = (function(_super) {

    __extends(Component, _super);

    function Component() {
      return Component.__super__.constructor.apply(this, arguments);
    }

    Component.prototype.local = true;

    Component.prototype.url = 'components/';

    Component.prototype.products = new Products;

    Component.prototype.defaults = {
      category: '',
      description: [],
      name: '',
      shown: true
    };

    Component.prototype.fetchProducts = function(locale) {
      this.products = new Products(this.attributes.category, locale);
      if (this.get('shown')) {
        return this.products.fetch();
      }
    };

    return Component;

  })(Backbone.Model);

}).call(this);
