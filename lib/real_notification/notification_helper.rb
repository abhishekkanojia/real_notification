module NotificationHelper
  def broadcast_notification(channel_name, data)
    ActionCable.server.broadcast channel_name, data: data
  end
end

ActiveRecord::Base.send :extend, NotificationHelper
