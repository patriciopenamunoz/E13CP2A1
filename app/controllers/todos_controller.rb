class TodosController < ApplicationController
  before_action :find_post, only: %I[show edit update destroy complete]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.completed = false
    @todo.save
    redirect_to todos_path
  end

  def show
    completed  = { txt: 'Completed',  bg: 'bg-success' }
    unfinished = { txt: 'Unfinished', bg: 'bg-danger' }
    @status = @todo.completed ? completed : unfinished
  end

  def edit
  end

  def update
    @todo.update(todo_params)
    redirect_to todos_path
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  def complete
    @todo.completed = true
    @todo.save
    redirect_to todos_path
  end

  def list
    @unfinished = Todo.where completed: false
    @finished = Todo.where completed: true
  end

  private

  def find_post
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:description)
  end
end
