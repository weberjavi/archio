class User < ActiveRecord::Base
  rolify
  has_and_belongs_to_many :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true
  validates :name, presence: true


  # Codigo limpio significa no tener metodos vacios. ;)
  def user_projects
  end


end
