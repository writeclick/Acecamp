class Collaborator < ActiveRecord::Base
  attr_accessible :project_id, :user_id

  def self.find_collaborations(user_id)
  	if Collaborator.any?
  		collaborations = Collaborator.select(:project_id).where(:user_id => user_id)
			collaborations.map! { |collaboration| collaboration = collaboration.project_id }
			Project.find(collaborations)
		else
			[]
		end
  end


end
