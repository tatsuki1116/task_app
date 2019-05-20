class TasksController < ApplicationController
	def index
		@tasks = Task.all.order(id: "DESC")
	end

	def sort

	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to @task
		else
		  render :new
		end

	def show
		@task = Task.find(params[:id])
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		task = Task.find(params[:id])
		task.update(task_params)
		redirect_to task_path(task.id)
	end

	def destroy
		task = Task.find(params[:id])
		task.destroy
		redirect_to root_path
	end

private
	def task_params
		params.require(:task).permit(:task_name,:details,:deadline_at)
	end

end
