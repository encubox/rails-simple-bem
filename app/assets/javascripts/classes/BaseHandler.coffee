window.App = {}
window.App.Blocks = {}
window.App.Controllers = {}
window.App.Actions = {}

class App.BaseHandler

  constructor: (container)->
    container = $(container)
    @$container = container
    @init()
    # @bind()

  init: ->

  # bind: ->
