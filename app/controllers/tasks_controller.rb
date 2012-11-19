class TasksController < ApplicationController
	def new
		@task = Task.new
		@tasklist = Tasklist.find(params[:tasklist_id])
	end

	def create
		@task = Task.new(params[:task])
		@tasklist = Tasklist.find(params[:tasklist_id])
		@task.tasklist_id = @tasklist.id			
		if @task.save
			redirect_to projects_path
		else
			render :new
		end
	end

	def show
		@project = Project.find(params[:id])
	end

	def destroy

	end

	def update

	end
end