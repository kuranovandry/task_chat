class Comment < ActiveRecord::Base
  belongs_to :worker
  belongs_to :user

  after_create_commit { relay_comment }
  after_destroy :delete_comment

  private

  def relay_comment
    CommentRelayJob.perform_later(self)
  end

  def delete_comment
    CommentDeleteJob.perform_later(id, worker_id)
  end
end
