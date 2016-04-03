class Context < ActiveRecord::Base
  belongs_to :project
  has_many :samples, dependent: :destroy
  has_many :find_bags, dependent: :destroy
  has_and_belongs_to_many :section_drawings
  has_and_belongs_to_many :plans
  # has_and_belongs_to_many :belows, class_name: "Context"
  # has_and_belongs_to_many :overs, class_name: "Context"
  belongs_to :contextable, polymorphic: true

  validates :ue, uniqueness: {scope: :project}

  
  
end
