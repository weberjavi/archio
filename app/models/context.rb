class Context < ActiveRecord::Base
  belongs_to :project
  has_many :samples
  has_many :find_bags
  # has_and_belongs_to_many :belows, class_name: "Context"
  # has_and_belongs_to_many :overs, class_name: "Context"
  belongs_to :contextable, polymorphic: true

  validates :ue, uniqueness: {scope: :project}

  
  
end
