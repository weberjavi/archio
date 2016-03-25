class Context < ActiveRecord::Base
  belongs_to :project
  
  has_and_belongs_to_many :belows, class_name: "Context"
  has_and_belongs_to_many :overs, class_name: "Context"

  belongs_to :contextable, polymorphic: true

  
  
end
