require 'spec_helper'

describe User do

  context 'A FactoryGirl method exists for generating User instances during testing: ' do
    describe '#create' do
      it 'is a valid factory for Users' do
        create(:user).should be_valid
      end
    end
  end

  context 'After submitting the new User Signup Form: ' do
    describe '#validates_presence_of' do
      it { should validate_presence_of :email }
    end

    describe '#validates_uniqueness of' do
      it { should validate_uniqueness_of :email }
    end
  end

  context 'When we need to access certain User attributes: ' do
    describe '#email' do
      it 'returns the email address of the user' do
        build(:user, email: "joe@gmail.com").email.should eq("joe@gmail.com")
      end
    end

    describe '#name' do
      it 'returns the name of the user' do
        build(:user, name: "Joe Smith").name.should eq("Joe Smith")
      end
    end
  end

  context 'When we need to find a User by their email address: ' do
    describe '.from_email(email_address)' do
      it 'returns a User object with the email_address provided' do
        the_user = create(:user, email: "boss@gmail.com")
        found_user = User.find_by_email("boss@gmail.com")
        found_user.should eq(User.from_email("boss@gmail.com"))
      end
      context 'Except when no User with that email address exists: ' do
        it 'then it does not return a User & returns nil' do
          User.from_email("does_not_exist@gmail.com").should be_nil
        end
      end
    end
  end

  context 'When we need to determine if a User owns a given Project: ' do
    describe '.owner?(project)' do
      it 'returns true if the_user is the owner (creator) of the project' do
        the_user = build(:user, id: 1)
        the_project = build(:project, user_id: 1)
        the_user.owner?(the_project).should be_true
      end
      it 'returns false if the_user is not the owner of the project' do
        the_user = build(:user, id: 2)
        the_project = build(:project, user_id: 1)
        the_user.owner?(the_project).should be_false
      end
    end
  end

  context 'When we need to determine if a User is a collaborator on a Project: ' do
    describe '.collaborator?(project)' do
      it 'returns true if the user has been added as a collaborator on the project' do
        the_user = create(:user, id: 1)
        the_project = create(:project, id: 1, user_id: 2)
        a_collaboration = create(:collaborator, user_id: 1, project_id: 1)
        the_user.collaborator?(the_project).should be_true
      end
      it 'returns false if the user is not a collaborator on this project' do
        the_user = create(:user, id: 2)
        the_project = create(:project, id: 2, user_id: 2)
        create(:project, id: 1, user_id: 2)
        a_collaboration = create(:collaborator, user_id: 1, project_id: 2)
      end
    end
  end
end