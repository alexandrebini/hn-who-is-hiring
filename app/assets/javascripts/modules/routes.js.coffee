@WhoIsHiring.module 'Modules', (Modules, App, Backbone, Marionette, $, _) ->

  class Modules.Routes
    @getInstance: ->
      @_instance ?= new @(arguments...)

    rootPath: ->
      @urlFor '/'

    postPath: (id) ->
      @urlFor "/posts/#{ id }/"

    urlFor: (route) ->
      Modules.UrlHelper.getInstance().urlFor route