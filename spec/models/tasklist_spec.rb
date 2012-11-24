require 'spec_helper'

describe Tasklist do

  context 'A FactoryGirl method exists for generating Tasklist instances during testing' do
    describe '#create' do
      it 'is a valid factory for Tasklists' do
        create(:tasklist).should be_valid
      end
    end
  end

  context 'When we need to access certain attributes of a Tasklist' do
    describe '#name' do
      it 'returns the name assigned to the Tasklist' do
        build(:tasklist, name: "I Am A Tasklist").name.should eq("I Am A Tasklist")
      end
    end

    describe '#project_id' do
      it 'returns the project_id assigned to the Tasklist' do
        build(:tasklist, project_id: 2).project_id.should eq(2)
      end
    end
  end
end
