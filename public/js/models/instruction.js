// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Instruction = (function(_super) {

    __extends(Instruction, _super);

    function Instruction() {
      return Instruction.__super__.constructor.apply(this, arguments);
    }

    Instruction.prototype.defaults = {
      step: 0,
      steps: 7
    };

    Instruction.prototype.text = function() {
      return kb.locale_manager.get('interior')[this.get('step')];
    };

    Instruction.prototype.next = function() {
      this.set('step', (this.get('step') + 1) % this.get('steps'));
      return this.get('step');
    };

    Instruction.prototype.previous = function() {
      this.set('step', this.get('step') - 1);
      if (this.get('step') < 0) {
        this.set('step', this.get('steps') - 1);
      }
      return this.get('step');
    };

    return Instruction;

  })(Backbone.Model);

}).call(this);
