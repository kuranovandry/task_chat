#= require action_cable
#= require_self
#= require_tree .

@App ||= {}
App.cable = ActionCable.createConsumer('ws://192.168.33.19:28080')
