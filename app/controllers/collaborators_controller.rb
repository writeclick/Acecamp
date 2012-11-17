class CollaboratorsController < ApplicationController
	before_filter :collaborator_instance

	def new
		@collaborator = Collaborator.new
	end

	def create
		@user = User.from_email(params[:email])
		@project = Project.find(params[:project_id])
		@collaborator = Collaborator.new(:user_id => @user.id, 
			                               :project_id => @project.id)
		@collaborator.save
		# @user = User.find(params[:user_id])
		redirect_to user_projects_path(params[:user_id])
	end

	def destroy

	end

	def collaborator_instance
			
	end
end
