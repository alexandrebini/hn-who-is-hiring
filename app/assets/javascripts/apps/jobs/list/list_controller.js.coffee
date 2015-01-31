@WhoIsHiring.module 'JobsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base
    initialize: ->
      @jobs = App.request 'job:entities'
      @layout = @getLayoutView()

      @listenTo @layout, 'show', =>
        @searchRegion()

        App.execute 'when:fetched', @jobs, =>
          @jobsRegion()
          # @paginationRegion() TODO

      App.jobsRegion.show @layout

    searchRegion: ->
      searchView = @getSearchView()
      @layout.searchRegion.show searchView

    jobsRegion: ->
      jobsView = @getJobsView()
      @layout.jobsRegion.show jobsView

    paginationRegion: ->
      paginationView = @getPaginationView()
      @layout.paginationRegion.show paginationView

    getLayoutView: ->
      new List.Layout()

    getSearchView: ->
      new List.SearchView()

    getJobsView: ->
      new List.JobsView(collection: @jobs)

    getPaginationView: ->
      new List.PaginationView(model: @jobs)