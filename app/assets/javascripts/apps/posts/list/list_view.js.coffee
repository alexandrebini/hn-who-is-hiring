@WhoIsHiring.module 'PostsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends Marionette.LayoutView
    template: 'posts/list/templates/layout'
    regions:
      postsRegion: '.posts-region'

  class List.PostView extends Marionette.ItemView
    tagName: 'li'
    template: 'posts/list/templates/post'

  class List.EmptyView extends Marionette.ItemView
    tagName: 'li'
    template: 'posts/list/templates/empty'

  class List.PostsView extends Marionette.CollectionView
    childView: List.PostView
    emptyView: List.EmptyView
    tagName: 'ul'