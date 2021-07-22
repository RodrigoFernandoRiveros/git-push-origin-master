# task_controller.rb
class TasksController < ApplicationController
  before_action :find_task, only: [:id]

  def index
    @tasks = Task.all # Mostrar todas las tareas
  end

  def show
    @tasks = Task.find(params[:id]) # Mostrar una tarea
  end

  def new
    @task = Task.new # Crear una nueva tarea
  end

  def create
    @task = Task.new(params[:task])
    @task.save
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params[:task]) # Actualizar una tarea
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy # Destruir una tarea

    # no need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path
  end
end
