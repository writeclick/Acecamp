require 'spec_helper'
#using shorthand for FactoryGirl#methods

describe Project do

  context 'A FactoryGirl method exists for generating Project instances during testing: ' do
    describe '#create' do
      it 'is a valid factory for Projects' do
        create(:project).should be_valid
      end
    end
  end

  context 'After submitting a form to create a #new Project: ' do
    describe '#validates_presence_of' do
      it { should validate_presence_of :title }
      it { should validate_presence_of :user_id }
    end
  end

  context 'When we need access to certain attributes of a Project: ' do
    describe '#title' do
      it 'returns the name of the project as a string' do
        build(:project, title: "A Test Project").title.should eq("A Test Project")
      end
    end

    describe '#description' do
      it 'returns the description of the project as a string' do
        build(:project, description: "A test description.").description.should eq("A test description.")
      end
    end
  end

end