class ListsController < ApplicationController

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List successfully added!"
      redirect_to list_path(@list)
    else
      render :new
    end
  end

# BELOW refactored out??
  def index
    @lists = List.all
    render :index
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks
    render :show
  end

  def new
    @list = List.new
    render :new
  end

  def edit
  @list = List.find(params[:id])
  render :edit
  end

# ABOVE refactored out??

  def update
    @list= List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

private
  def list_params
    params.require(:list).permit(:name)
  end

end
