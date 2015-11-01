class DocumentChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "documents:#{data['document_id'].to_i}"
  end

  def unfollow
    stop_all_streams
  end
end
