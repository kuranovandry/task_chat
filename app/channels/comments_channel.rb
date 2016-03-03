class CommentsChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "workers:#{data['worker_id'].to_i}:comments"
  end

  def unfollow
    stop_all_streams
  end
end
