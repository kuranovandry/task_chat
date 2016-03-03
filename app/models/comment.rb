class Comment < ActiveRecord::Base
  belongs_to :worker
  belongs_to :user

  after_create_commit { relay_comment }

  def relay_comment
    CommentRelayJob.perform_later(self )
  end

end
