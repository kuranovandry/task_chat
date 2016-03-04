class CommentsController < ApplicationController
  before_action :set_worker, only: %i( create )

  def create
    @comment = Comment.create(content: comment_content ,
                              worker: @worker,
                              user: current_user,
                              position: calculate_position(current_user))

    return render nothing: true, status: 201 if @comment.save
    flash[:error] = t('comment.not_create')
    render :new
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = t('comment.successful_destroy')
    else
      flash[:error] = t('comment.error_destroy')
    end
    redirect_to(:back)
  end

  private

  def comment_content
    params[:comment].present? ? params[:comment][:content] : flash[:error] = t('comment.not_create_comment')
  end

  def calculate_position(current_user)
    current_user.id == @worker.user.id ? 1 : -1
  end

  def set_worker
    @worker = Worker.find(params[:worker_id])
  end
end
