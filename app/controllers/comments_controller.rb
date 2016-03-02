class CommentsController < ApplicationController
  before_action :set_worker

  def create
    @comment = Comment.create! content: params[:comment][:content], worker: @worker, user: current_user,
      position: calculate_position(current_user)
  end

  private
  def calculate_position(current_user)
    position = 0
    current_user.id == @worker.user.id ? position-=1 : position+=1
  end

  def set_worker
    @worker = Worker.find(params[:worker_id])
  end
end
