class Project < ActiveRecord::Base
  resourcify
  validates :description, presence: true
  validates :name, presence: true
end
