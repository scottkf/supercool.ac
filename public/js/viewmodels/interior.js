// Generated by CoffeeScript 1.3.3
(function() {

  window.InteriorViewModel = function(model) {
    this.model = model;
    this.label = kb.observable(kb.locale_manager, 'interior');
    this.next = function() {
      this.model.next();
      this.model.get('step');
      return this.reloadPopover();
    };
    this.previous = function() {
      this.model.previous();
      this.model.get('step');
      return this.reloadPopover();
    };
    this.reloadPopover = function() {
      var popover;
      popover = $('.popover.interior');
      popover.attr('data-step', this.step());
      return popover.find('.popover-content p').html(this.label()[this.step()]);
    };
    this.step = kb.observable(this.model, 'step');
    return this;
  };

}).call(this);
