class <%= class_name_for_file %>Channel < ApplicationCable::Channel
  def subscribed
    stream_from "<%= file_name %>_channel"
  end
end
