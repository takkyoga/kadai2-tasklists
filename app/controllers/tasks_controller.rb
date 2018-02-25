class TasksController < ApplicationController

before_action :require_user_logged_in

def index
  @tasks = current_user.tasks
end

def create
  @task = current_user.tasks.build(task_params)
  
  if @task.save
    flash[:sucess] = "新しいタスクを登録しました"
    redirect_to root_url
  else
    @tasks = current_user.tasks
    flash.now[:danger] = "登録失敗"
    render :new
  end
  
end

def new
  @task = Task.new
end

def edit
  @task = current_user.tasks.find(params[:id])
end

def show
  @task = current_user.tasks.find(params[:id])
end

def update
  @task = current_user.tasks.find(params[:id])
  
  if @task.update(task_params)
    flash[:sucess] = "successfully updated"
    redirect_to @task
  else
    flash.now[:danger] = "failed"
    render :edit
  end

end

def destroy
  @task = current_user.tasks.find(params[:id])
  @task.destroy
  
  flash[:success] = "successfully destroyed"
  redirect_to tasks_url
end
  
private

#strong parameter
def task_params
  params.require(:task).permit(:content, :status)
end

end