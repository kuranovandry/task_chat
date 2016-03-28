class CommentDeleteJob < ApplicationJob
  def perform(id, worker_id)
    ActionCable.server.broadcast "workers:#{worker_id}:comments",
                                 comment_id: id,
                                 type: 'comment_deleted'
  end
end
