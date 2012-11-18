class User < ActiveRecord::Base
  has_and_belongs_to_many :collaborators
  has_many :projects
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true, :uniqueness => true
  validates_uniqueness_of :name, :email, :case_sensitive => false

  

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me
  

  def self.from_email(email_address)
    User.find_by_email(email_address)
  end

  def owner?(project)
    self.id == project.id
  end

  def collaborator?(project)
    @collaborator = Collaborator.find_by_project_id(project.id)
    self.id == @collaborator.user_id
#    Collaborator.where(:user_id => self.id).where(:project_id => project.id) == !nil ? true : false
  end
  
end
