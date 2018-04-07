App.<%= file_name %> = App.cable.subscriptions.create "<%= class_name_for_file %>Channel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
