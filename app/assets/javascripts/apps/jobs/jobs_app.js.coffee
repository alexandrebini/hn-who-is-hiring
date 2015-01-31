@WhoIsHiring.module 'JobsApp', (JobsApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API =
    start: ->
      @list()

    list: ->
      @listController = new JobsApp.List.Controller()

  JobsApp.on 'start', ->
    API.start()