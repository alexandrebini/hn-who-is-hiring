//= require jquery

# Foundation
//= require jquery.cookie
//= require fastclick
//= require foundation.min
//= require modernizr
//= require placeholder

# Marionette
//= require underscore
//= require backbone
//= require backbone.babysitter
//= require backbone.wreqr
//= require backbone.marionette
//= require backbone.paginator

# Other
//= require hamlcoffee
//= require moment.min

# App
//= require_tree ./config
//= require app
//= require_tree ./base
//= require_tree ./entities
//= require_tree ./modules
//= require_tree ./apps

$(document).ready ->
  WhoIsHiring.start()