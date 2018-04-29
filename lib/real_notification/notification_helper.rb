module NotificationHelper
  def broadcast_notification(channel_name = 'notification_channel', data)
    ActionCable.server.broadcast channel_name, data
  end
end

ActiveRecord::Base.send :extend, NotificationHelper
