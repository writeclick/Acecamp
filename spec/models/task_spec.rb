require 'spec_helper'

describe Task do

  context 'A FactoryGirl method exists for generating Task instances during testing' do
    describe '#create' do
      it 'is a valid factory for Tasks' do
        create(:task).should be_valid
      end
    end
  end

  context 'When we need to access certain attributes of a Task: ' do
    let(:a_tasklist) do
      create(:tasklist, id: 1)
    end

    let(:the_task) do
      create(:task,
              name: "Task Name",
              description: "Descriptive task text.",
              tasklist_id: a_tasklist.id)
    end

    describe '#name' do
      it 'returns the name of the task' do
        the_task.name.should eq("Task Name")
      end
    end

    describe '#description' do
      it 'returns the description of the task' do
        the_task.description.should eq("Descriptive task text.")
      end
    end

    describe '#tasklist_id' do
      it 'returns the tasklist_id of the task' do
        the_task.tasklist_id.should eq(1)
      end
    end
  end
end
