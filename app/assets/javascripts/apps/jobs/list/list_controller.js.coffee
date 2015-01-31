@WhoIsHiring.module 'JobsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base
    initialize: ->
      @jobs = App.request 'job:entities'
      @layout = @getLayoutView()

      @listenTo @layout, 'show', =>
        App.execute 'when:fetched', @jobs, =>
          @jobsRegion()
          # @paginationRegion() TODO

      App.jobsRegion.show @layout

    jobsRegion: ->
      paginationView = @getJobsView()
      @layout.jobsRegion.show paginationView

    paginationRegion: ->
      paginationView = @getPaginationView()
      @layout.paginationRegion.show paginationView

    getLayoutView: ->
      new List.Layout()

    getJobsView: ->
      new List.JobsView(collection: @jobs)

    getPaginationView: ->
      new List.PaginationView(model: @jobs)