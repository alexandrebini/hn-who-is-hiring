@WhoIsHiring = do (Backbone, Marionette) ->
  App = new Marionette.Application

  App.addRegions
    postsRegion: '.posts-region'
    jobsRegion: '.jobs-region'

  App.addInitializer ->
    App.module('PostsApp').start()

  App.on 'start', ->
    @startHistory()

  App