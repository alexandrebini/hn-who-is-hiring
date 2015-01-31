@WhoIsHiring.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Job extends Backbone.Model
    parse: (resp, options) ->
      @set published_at: Date.parse(resp.published_at)
      delete resp.published_at
      resp

  class Entities.Jobs extends Backbone.Collection
    model: Entities.Job
    url: '/api/jobs.json'

  API =
    getJobs: ->
      jobs = new Entities.Jobs()
      jobs.fetch()
      jobs

  App.reqres.setHandler 'job:entities', ->
    API.getJobs()