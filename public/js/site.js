// Generated by CoffeeScript 1.3.3
(function() {

  $(function() {
    var cursor_shown, resetSlideShow, time, timer,
      _this = this;
    $('a[rel="popover"]').popover({
      template: '<div class="popover car"><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>'
    });
    $('a[rel="instruction"]').popover({
      template: '<div class="popover interior" data-step="0"><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p data-bind="text: interior.label()[interior.step()]"></p></div></div></div>'
    });
    $('.modal').modal({
      backdrop: false,
      show: false
    });
    cursor_shown = false;
    $('#leak-text').on('touchstart', function(e) {
      if (cursor_shown === true) {
        $($('#leak-text').attr('href')).modal('show');
      }
      cursor_shown = true;
      e.stopPropagation();
      $('#uv-light').css('display', 'block');
      $('#uv-light').css('opacity', '1');
      return $('#leak-image').css('opacity', '1');
    });
    $('#leak-text').on('click', function(e) {
      if (cursor_shown === true) {
        $($('#leak-text').attr('href')).modal('show');
      }
      cursor_shown = true;
      e.stopPropagation();
      $('body').css('cursor', 'url(/img/uv-light.png) 30 100, default');
      return $('a').css('cursor', 'url(/img/uv-light.png) 30 100, pointer');
    });
    $('body').on('click', function() {
      cursor_shown = false;
      $('body').css('cursor', '');
      $('a').css('cursor', '');
      $('#leak-image').css('opacity', '0');
      $('#uv-light').css('opacity', '0');
      return $('#uv-light').css('display', 'none');
    });
    $('#leak-button').on('hover', function() {
      if (cursor_shown) {
        if ($('#leak-image').css('opacity') === '0') {
          $('#leak-image').css('opacity', '1');
        } else {
          $('#leak-image').css('opacity', '0');
        }
      }
    });
    document.body.addEventListener('touchmove', function(event) {
      return event.preventDefault();
    });
    timer = null;
    time = 5000;
    resetSlideShow = function() {
      stopSlideShow();
      return setTimeout(function() {
        return startSlideShow();
      }, 1000);
    };
    $('#hybrid-button').on('click', function() {
      $('#car').attr('src', 'img/hybrid-car.jpg');
      app.viewmodels.components.components.collection().models[1].set('category', 'hybrid-compressor');
      $('a[rel]').popover('hide');
      return clearInterval(timer);
    });
    $('#standard-button').on('click', function() {
      $('#car').attr('src', 'img/standard-car.jpg');
      app.viewmodels.components.components.collection().models[1].set('category', 'compressor');
      $('a[rel]').popover('hide');
      return clearInterval(timer);
    });
    $('#interior-button').on('click', function() {
      $('.modal').modal('hide');
      clearInterval(timer);
      $('a[rel]').popover('hide');
      $('a[rel=instruction]').popover('show');
      return timer = setInterval(function() {
        return app.viewmodels.interior.next();
      }, time);
    });
    $('#content').on('click', 'i', function() {
      switch ($(this).attr('class')) {
        case 'icon-stop':
          clearInterval(timer);
          return $(this).attr('class', 'icon-play');
        case 'icon-play':
          $(this).attr('class', 'icon-stop');
          return timer = setInterval(function() {
            return app.viewmodels.interior.next();
          }, time);
        default:
          if ($(this).attr('class') === 'icon-forward') {
            app.viewmodels.interior.next();
          } else {
            app.viewmodels.interior.previous();
          }
          clearInterval(timer);
          return timer = setInterval(function() {
            return app.viewmodels.interior.next();
          }, time);
      }
    });
    $('.modal').live('show', function() {
      if (!$(this).hasClass('in')) {
        return $('.modal').modal('hide');
      }
    });
    $('#vehicle-toggle button').on('click', function() {
      var target;
      $('.vehicle-group').hide();
      target = $(this).attr('data-target');
      return $('#' + target).show();
    });
    return $('.modal').draggable();
  });

}).call(this);
