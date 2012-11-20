class ProjectsController < ApplicationController
	
	before_filter :load_user
	before_filter :load_project, :except => [:new, :create, :index]	

	def index
		@project = Project.new
		@projects = @user.projects
		@collaborations = Collaborator.find_collaborations(@user.id)
		#@tasklists = @projects.tasklists
		@task = Task.new
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(params[:project])
		@project.user_id = @user.id
		if @project.save
			redirect_to project_path(@project.id) 
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy

	end

private

	def load_user
		@user = current_user
	end

	def load_project
		@project = Project.find(params[:id])
	end
	
end

