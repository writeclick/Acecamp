class ProjectsController < ApplicationController

	def index
		@user = User.find(current_user.id)
		@projects = @user.projects
		
	end

	def new
		@user = User.find(params[:user_id])
		@project = Project.new
	end

	def create
		@user = User.find(params[:user_id])
		@project = Project.new(params[:project])
		@project.user_id = @user.id

		if @project.save
			redirect_to user_project_path(@user.id, @project.id)
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:user_id]) ||
			User.find_by_email(params[:user][:email])
		@project = Project.find(params[:id])
		@collaborator = Collaborator.new
	end

	def edit
		@user = User.find(params[:user_id])
		@project = Project.find(params[:id])
	end

	def update
		@user = User.find(params[:user_id])
		@project = Project.find(params[:id])
	end

	def destroy
		@user = User.find(params[:user_id])
		@project = Project.find(params[:id])
	end
	
end

