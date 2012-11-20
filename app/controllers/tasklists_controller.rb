class TasklistsController < ApplicationController

	before_filter :load_tasklist, :except => [:new, :create]

	def new
		@tasklist = Tasklist.new
	end

	def create
		@project = Project.find(params[:project_id])
		@tasklist = Tasklist.new(params[:tasklist])
		@tasklist.project_id = @project.id			
		if @tasklist.save
			redirect_to projects_path
		else
			render :new
		end
	end

	def update

	end

	def destroy

	end

private
	
	def load_tasklist
		@tasklist = Tasklist.find(params[:id])
	end

end
