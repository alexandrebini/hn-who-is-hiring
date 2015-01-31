@WhoIsHiring.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Post extends Backbone.Model
    parse: (resp, options) ->
      @set published_at: Date.parse(resp.published_at)
      delete resp.published_at
      resp

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