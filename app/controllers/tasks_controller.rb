class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = '登録完了'
      redirect_to @task
    else
      flash.now[:danger] = '登録失敗'
      render :new
    end
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = '編集完了'
      redirect_to @task
    else
      flash.now[:success] = '編集失敗'
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = '削除完了'
    redirect_to tasks_url
    
  end
end

private

def task_params
  params.require(:task).permit(:content)
end