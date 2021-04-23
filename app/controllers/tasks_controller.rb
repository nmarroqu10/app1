class TasksController < ApplicationController
  before_action :set_projects
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET projects/1/tasks
  def index
    @tasks = @projects.tasks
  end

  # GET projects/1/tasks/1
  def show
  end

  # GET projects/1/tasks/new
  def new
    @task = @projects.tasks.build
  end

  # GET projects/1/tasks/1/edit
  def edit
  end

  # POST projects/1/tasks
  def create
    @task = @projects.tasks.build(task_params)

    if @task.save
      redirect_to([@task.projects, @task], notice: 'Task was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT projects/1/tasks/1
  def update
    if @task.update_attributes(task_params)
      redirect_to([@task.projects, @task], notice: 'Task was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/tasks/1
  def destroy
    @task.destroy

    redirect_to projects_tasks_url(@projects)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projects
      @projects = Project.find(params[:projects_id])
    end

    def set_task
      @task = @projects.tasks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :description, :status, :project_id)
    end
end
