# task_controller.rb
class TasksController < ApplicationController
  before_action :find_task, only: [:id]
  def index
    @tasks = Task.all
  end

  def find_task
    @tasks = Task.find(params[:id])
  end
end
