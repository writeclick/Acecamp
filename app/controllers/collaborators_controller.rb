class CollaboratorsController < ApplicationController

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
		redirect_to projects_path
	end

	def destroy

	end

	def collaborator_instance
			
	end
end
