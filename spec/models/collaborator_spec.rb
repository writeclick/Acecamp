require 'spec_helper'

describe Collaborator do

  context 'A FactoryGirl method exists for generating Collaborator instances during testing: ' do
    describe '#create' do
      it 'is a valid factory for Collaborators' do
        create(:collaborator).should be_valid
      end
    end
  end

  context 'We need to find all collaborations for a given user_id: ' do
    describe '.find_collaborations(user_id)' do
      it 'returns a list of projects for which the user w/ user_id is a collaborator' do
        the_user = create(:user, id: 9)
        some_projects = []
        5.times do |count|
          some_projects << create(:project)
          if count % 2 == 0
            collaborations = create(:collaborator,
                                    project_id: some_projects.last.id,
                                    user_id: 9)
          end
        end
        Collaborator.find_collaborations(the_user.id).should have_at_most(3).things
      end
    end
  end
end
