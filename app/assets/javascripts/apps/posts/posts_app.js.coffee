@WhoIsHiring.module 'PostsApp', (PostsApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    start: ->
      @list()

    list: ->
      @listController = new PostsApp.List.Controller()

  PostsApp.on 'start', ->
    API.start()