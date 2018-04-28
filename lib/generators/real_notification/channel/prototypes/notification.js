/* globals App */
/* globals RealNotification */
var notification = new RealNotification();

App.<%=file_name %> = App.cable.subscriptions.create("<%= class_name_for_file %>Channel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.log(data);
    notification.show(data);
    // Called when there's incoming data on the websocket for this channel
  }
});
