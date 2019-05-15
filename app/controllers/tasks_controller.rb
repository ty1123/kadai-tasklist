class TasksController < ApplicationController
  before_action :set_tasks, only:[:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end

  def edit
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
    if @task.update(task_params)
      flash[:success] = '編集完了'
      redirect_to @task
    else
      flash.now[:success] = '編集失敗'
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = '削除完了'
    redirect_to tasks_url
  end

  private
  
  def set_tasks
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
