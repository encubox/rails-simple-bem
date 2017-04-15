class App.Blocks.Wodoo extends App.BaseHandler

  init: ->
    @$container.find('.js-item').click ->
      alert($(this).data('text'))
