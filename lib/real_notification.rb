require "real_notification/version"
require "real_notification/notification_helper" if defined? ActiveRecord::Base

module RealNotification
  module Rails
    require 'real_notification/engine'
  end
end
