require 'spec_helper'

describe ProjectsController do

  # this is needed b/c we're using devise for authentication, and we need test data
  before(:each) do
    @user = create(:user)
    @some_projects = []
    5.times do |count|
      @some_projects << create(:project, user_id: @user.id)
      create(:collaborator,
              project_id: @some_projects.last.id,
              user_id: @some_projects.last.user_id)
    end
    sign_in @user
  end

  describe 'GET #index' do
    it 'assigns a new Project to @project' do
      get :index
      assigns(:project).should be_a_new(Project)
    end
    it 'assigns all of the projects owned by the logged-in user to @projects' do
      get :index
      assigns(:projects).should eq(@some_projects)
    end
    it 'assigns all projects the user is a collaborator on to @collaborations' do
      get :index
      assigns(:collaborations).should eq(@some_projects)
    end
  end

  describe 'POST #create' do
  end

  describe 'GET #new' do
  end

  describe 'GET #edit' do
  end

  describe 'GET #show' do
  end

  describe 'PUT #update' do
  end

  describe 'DELETE #destroy' do
  end

end
