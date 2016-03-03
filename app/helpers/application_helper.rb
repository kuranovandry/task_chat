module ApplicationHelper

  def call_comments_class(comment)
    comment.position == 1 ? 'comment_other' : 'comment_my'
  end

end
