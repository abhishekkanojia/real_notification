module CanSendRealNotification
  module ClassMethods

    def can_send_real_notification(klass)
      @@can_send_real_notification = true
    end

    def broadcast_notification(channel_name, data)
      debugger
      if self.can_send_real_notification
        ActionCable.server.broadcast channel_name, data: data
      end
    end
  end

  def self.included(receiver)
    receiver.extend(ClassMethods)
  end
end
