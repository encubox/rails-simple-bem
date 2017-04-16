String.prototype.capitalizeFirstLetter = ->
  return this.charAt(0).toUpperCase() + this.slice(1);

$ ->
  window.handlerInit = (selector, className)->
    $(selector).each (i, e)->
      className = objectPath.get(window, className)
      if typeof className is 'function'
        new className(e)

  do window.appinit = ->
    $('[data-handler]').each (i, e) -> handlerInit e, e.getAttribute('data-handler')

    $('.page').each (i, e) ->
      handlerInit(e, 'App.Actions.' + e.getAttribute('data-page-controller').capitalizeFirstLetter() + e.getAttribute('data-page-action').capitalizeFirstLetter())
      handlerInit(e, 'App.Controllers.' + e.getAttribute('data-page-controller').capitalizeFirstLetter())

  $(document).ajaxSuccess -> appinit()
