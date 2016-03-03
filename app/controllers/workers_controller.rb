class WorkersController < ApplicationController
  before_action :set_worker, only: %i(show)

  def index
    @workers = Worker.all
  end

  def show
    @worker_comments = @worker.comments.order('position DESC, created_at DESC')
  end

  private

  def set_worker
    @worker = Worker.find(params[:id])
  end
end
