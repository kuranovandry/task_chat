class WorkersController < ApplicationController

  def index
    @workers = Worker.all
  end

  def show
    @worker = Worker.find(params[:id])
  end
end
