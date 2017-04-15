class App.Blocks.Magic extends App.BaseHandler

  init: ->
    @$container.find('.js-inner').hover ->
      rand = [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' ]
      color = '#' + rand[Math.ceil(Math.random() * 15)] + rand[Math.ceil(Math.random() * 15)] + rand[Math.ceil(Math.random() * 15)] + rand[Math.ceil(Math.random() * 15)] + rand[Math.ceil(Math.random() * 15)] + rand[Math.ceil(Math.random() * 15)]
      $(this).css("background-color", color);
