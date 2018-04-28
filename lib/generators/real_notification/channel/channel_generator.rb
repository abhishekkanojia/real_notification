require 'rails/generators/base'

module RealNotification
  module Generators
    class ChannelGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../prototypes/', __FILE__)

      argument :channel_name, type: :string, default: 'notification'

      def create_channel_file
        template "notification_channel.rb", "app/channels/#{file_name}_channel.rb"
      end

      def create_coffee_script
        template "notification.js", "app/assets/javascripts/channels/#{file_name}.js"
      end

      private

        def file_name
          channel_name.underscore
        end

        def class_name_for_file
          channel_name.underscore.downcase.split('_').map(&:capitalize).join
        end
    end
  end
end
