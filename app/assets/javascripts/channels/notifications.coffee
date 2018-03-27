if $("meta[name='current-user']").length > 0
  App.notifications = App.cable.subscriptions.create "NotificationsChannel",
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $("#notifications").prepend(data.html);
      # Called when there's incoming data on the websocket for this channel
