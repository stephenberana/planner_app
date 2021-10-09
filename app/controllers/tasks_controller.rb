class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]

#index all tasks
def index
    @tasks = Task.all
end

#initiate new task
def new
    @task = Task.new
end

#show task
def show
end

#create new task log
def create
    @task = Task.new(task_params)

    if task.save
        redirect_to @task, notice: 'Task successfully logged.'
    else
        render :new
    end
end

#update task log
def update 
    if @task.update(task_params)
        redirect_to @task, notice: 'Task successfully updated.'
    else
        render :edit
    end
end

#delete task log
def destroy
    @task.destroy
    redirect_to rooth_path, notice: 'Task was successfully deleted.'
end

private
    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:task_title, :description, :due_date, :category:references)
    end