@WhoIsHiring.module 'JobsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base
    initialize: ->
      @jobs = App.request 'job:entities'
      @layout = @getLayoutView()

      @listenTo @layout, 'show', =>
        App.execute 'when:fetched', @jobs, =>
          @jobsRegion()

      App.jobsRegion.show @layout

    jobsRegion: ->
      postsView = @getJobsView()
      @layout.jobsRegion.show postsView

    getLayoutView: ->
      new List.Layout()

    getJobsView: ->
      new List.JobsView(collection: @jobs)