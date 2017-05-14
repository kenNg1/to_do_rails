require('pry')

class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def edit
  @list = List.find(params[:list_id])
  @task = Task.find(params[:id])
  render :edit
  end

# ABOVE refactored out??

  def update
    @task= Task.find(params[:id])
    if @task.update(task_params)
      redirect_to list_path(@task.list)
    else
      render :edit
    end
  end

  def mark_done
    #todo mark selected tasks as complete_tasks
    binding.pry

    redirect_to :back
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to :back
  end

  def complete
    # selected tasks as complete_tasks
    redirect_to tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:description, :done)
    end
end
