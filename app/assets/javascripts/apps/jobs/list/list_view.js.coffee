@WhoIsHiring.module 'JobsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends Marionette.LayoutView
    template: 'jobs/list/templates/layout'
    regions:
      jobsRegion: '.jobs-region'
      paginationRegion: '.pagination-region'

  class List.JobView extends Marionette.ItemView
    template: 'jobs/list/templates/job'
    className: 'panel'
    templateHelpers:
      publishedAtFormatted: ->
        moment(@published_at).format('MM/DD/YYYY')

  class List.PaginationView extends Marionette.ItemView
    template: 'jobs/list/templates/pagination'
    serializeData: ->
      @model.state

  class List.EmptyView extends Marionette.ItemView
    template: 'jobs/list/templates/empty'

  class List.JobsView extends Marionette.CollectionView
    childView: List.JobView
    emptyView: List.EmptyView