class Project < ActiveRecord::Base
  resourcify
  has_many :contexts
  has_and_belongs_to_many :users
  
  validates :description, presence: true
  validates :name, presence: true


  def add_admin_to_project_roles
    @new_admin = User.find_by(email: params[:email])
    @new_admin.add_role :admin
  end
  def self.authenticate_admin
    @user = User.find_by(id: params[:user_id])
    @user.has_role? :admin
  end
  
end
