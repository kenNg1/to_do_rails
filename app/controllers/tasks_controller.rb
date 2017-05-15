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
      # redirect_to list_path(@task.list)
      flash[:notice] = "Task successfully added!"
      respond_to do |format|
        format.html { redirect_to list_path(@task.list) }
        # format.js
      end
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
    Task.where(id: params[:task_ids]).update_all(done: 'true')
    list_id = Task.find(params[:task_ids].first).list_id
    redirect_to list_path(list_id)
  end

  private
    def task_params
      params.require(:task).permit(:description, :done)
    end
end
