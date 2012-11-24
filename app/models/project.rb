class Project < ActiveRecord::Base
  attr_accessible :description, :title, :tasklist
  belongs_to :user
  has_many :collaborators
  has_many :tasklists

  validates_presence_of :title, :user_id
end
