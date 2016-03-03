class CommentRelayJob < ApplicationJob
  def perform(comment)
    ActionCable.server.broadcast "workers:#{comment.worker_id}:comments",
      comment: CommentsController.render(partial: 'comments/comment', locals: { comment: comment })
  end
end
