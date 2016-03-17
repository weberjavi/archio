class Project < ActiveRecord::Base
  resourcify
  has_many :contexts
  # has_many :building_sheets
  # has_many :timber_sheets
  # has_many :masonry_sheets
  # has_many :context_sheets
  # has_many :skeleton_sheets

  belongs_to :user
  
  validates :description, presence: true
  validates :name, presence: true

  def add_admin_to_project_roles(user_id)
    
  end
end
