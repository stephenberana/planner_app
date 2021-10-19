class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task, only: [:show, :edit, :update, :destroy]

#index all tasks
def index
    @tasks = current_user.tasks
end

#initiate new task
def new
    @task = current_user.tasks.build
end

#show task
def show
end

#create new task log
def create
    @task = current_user.tasks.build(task_params)

    if @task.save!
        flash[:success] = 'Task listed!'
        redirect_to @task
    else
        flash[:warning] = 'All fields must be filled before a task can be created.'
        render :new
    end
end

#find editable task
def edit
    @task = current_user.tasks.find(params[:id])
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
    redirect_to root_path, notice: 'Task was successfully deleted.'
end

#mark task as complete
# def set_completed
#     @task = Task.find(params[:id])
#     @task.update_column :completed, params[:completed]
#     render nothing: true
# end

private
    def set_task
        @task = current_user.tasks.find_by(id: params[:id])
    end

    def task_params
        params.require(:task).permit(:task_title, :description, :due_date, :category_id, :user_id)
    end
end