module ApplicationHelper

  def call_comments_class(comment)
    comment.position == 1 ? 'comment_other' : 'comment_my'
  end

  def bootstrap_class_for(flash_type)
    case flash_type
      when 'success'
        "alert-success"
      when 'error'
        "alert-error"
      else
        "alert-info"
    end
  end

end
