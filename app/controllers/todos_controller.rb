class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.create(todo_params)
    redirect_to todos_path
  end

  def show
    @todo = Todo.find(params[:id])
    completed  = { txt: 'Completed',  bg: 'bg-success' }
    unfinished = { txt: 'Unfinished', bg: 'bg-danger' }
    @status = @todo.completed ? completed : unfinished
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end
end
