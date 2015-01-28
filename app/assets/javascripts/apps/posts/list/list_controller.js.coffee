@WhoIsHiring.module 'PostsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base
    initialize: ->
      @posts = App.request 'post:entities'
      @layout = @getLayoutView()

      @listenTo @layout, 'show', =>
        App.execute 'when:fetched', @posts, =>
          @postsRegion()

      App.postsRegion.show @layout

    postsRegion: ->
      postsView = @getPostsView()
      @layout.postsRegion.show postsView

    getLayoutView: ->
      new List.Layout()

    getPostsView: ->
      new List.PostsView(collection: @posts)