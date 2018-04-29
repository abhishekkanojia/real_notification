/* globals App */
/* globals RealNotification */

App.<%=file_name %> = App.cable.subscriptions.create("<%= class_name_for_file %>Channel", {
  connected: function() {
    console.log('Notification Channel connected.');
  },

  disconnected: function() {
    console.log('Notification Channel disconnected.');
  },

  received: function(data) {
    var notification = new RealNotification({
      delay: 7000, // default hide notification delay is 6000
      position: 'top' // default position is top-right see available options below
    });
    notification.show(data);
  }
});

/*

  Available positions options are:

  top : notification will be placed in middle top of screen.

  top-left : notification will be placed in top left corner of screen.

  top-right : notification will be placed in top left corner of screen.

  bottom : notification will be placed in middle bottom of screen.

  bottom-left : notification will be placed in bottom left corner of screen.

  bottom-right : notification will be placed in bottom right corner of screen.

*/
