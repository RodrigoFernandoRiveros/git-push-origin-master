# task_controller.rb
class TasksController < ApplicationController
  before_action :find_task, only: [:id]

  def index
    @tasks = Task.all # Mostrar todas las tareas
  end

  def show
    @task = Task.find(params[:id]) # Mostrar una tarea
  end

  def new
    @task = Task.new # Crear una nueva tarea
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params) # Actualizar una tarea
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy # Destruir una tarea

    # no need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
