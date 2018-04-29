function RealNotification(data) {
  this.notificationDiv       = $('[data-notification=real-notification]');
  this.notificationTitle     = this.notificationDiv.find('#title');
  this.notificationMessage   = this.notificationDiv.find('#message');
  this.setOptions(data);
}

RealNotification.prototype.setOptions = function(data) {
  this.notificationHideDelay = (data && data.delay) ? data.delay : 6000;
  this.notificationPosition  = (data && data.position) ? data.position : 'top-right';
};

RealNotification.prototype.CSS_CLASSES = {
  top         : 'notification-top',
  bottom      : 'notification-bottom',
  topLeft     : 'notification-top-left',
  topRight    : 'notification-top-right',
  bottomLeft  : 'notification-bottom-left',
  bottomRight : 'notification-bottom-right'
};

RealNotification.prototype.show = function(response) {
  this.positionNotification();
  this.notificationTitle.text(response.title);
  this.notificationMessage.text(response.message);
  this.notificationDiv.show()
                      .delay(this.notificationHideDelay)
                      .fadeOut();
};

RealNotification.prototype.positionNotification = function() {
  switch(this.notificationPosition) {

    case 'top':
      this.notificationDiv.addClass(this.CSS_CLASSES.top);
      break;

    case 'top-left':
      this.notificationDiv.addClass(this.CSS_CLASSES.topLeft);
      break;

    case 'bottom-left':
      this.notificationDiv.addClass(this.CSS_CLASSES.bottomLeft);
      break;

    case 'bottom-right':
      this.notificationDiv.addClass(this.CSS_CLASSES.bottomRight);
      break;

    case 'bottom':
      this.notificationDiv.addClass(this.CSS_CLASSES.bottom);
      break;

    case 'top-right':
      this.notificationDiv.addClass(this.CSS_CLASSES.topRight);
      break;

    default:
      alert('RealNotification: Invalid position option supplied.');
  }
};
