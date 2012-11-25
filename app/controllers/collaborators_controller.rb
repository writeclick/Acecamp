class CollaboratorsController < ApplicationController

	def new
		@collaborator = Collaborator.new
	end

	def create
		@user = User.from_email(params[:email])
		@project = Project.find(params[:project_id])
		@collaborator = Collaborator.new(:user_id => @user.id, 
			                               :project_id => @project.id)
		if @collaborator.save
			redirect_to root_path
		end
	end

	def destroy

	end

end
