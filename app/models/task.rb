class Task < ActiveRecord::Base
  attr_accessible :description, :name, :tasklist_id
  belongs_to :tasklist
end
