@WhoIsHiring.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Post extends Backbone.Model

  class Entities.Posts extends Backbone.Collection
    model: Entities.Post
    url: '/api/posts.json'

  API =
    getPosts: ->
      posts = new Entities.Posts()
      posts.fetch()
      posts

  App.reqres.setHandler 'post:entities', ->
    API.getPosts()