class Project < ActiveRecord::Base
  resourcify
  has_many :contexts, dependent: :destroy
  has_and_belongs_to_many :users
  
  validates :description, presence: true
  validates :name, presence: true

  
  def self.authenticate_admin
    @user = User.find_by(id: params[:user_id])
    @user.has_role? :admin
  end
  
end
