class Project < ActiveRecord::Base
  resourcify
  belongs_to :users
  validates :description, presence: true
  validates :name, presence: true

  def add_admin_to_project_roles(user_id)
    
  end
end
