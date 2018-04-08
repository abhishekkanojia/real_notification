require "real_notification/version"

module RealNotification
  module ClassMethods
    def broadcast_notification(channel_name, data)
      ActionCable.server.broadcast channel_name, data: data
    end
  end

  def self.included(receiver)
    receiver.extend(ClassMethods)
  end
end

class ActiveRecord::Base
  include RealNotification
end
