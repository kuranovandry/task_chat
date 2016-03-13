#= require action_cable
#= require_self
#= require_tree .

@App ||= {}
App.cable = ActionCable.createConsumer("ws://#{location.hostname}:28080")

$ ->
  setTimeout ->
    $('#comment_content').get(0).focus()
  , 500
