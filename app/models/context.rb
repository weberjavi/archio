class Context < ActiveRecord::Base
  belongs_to :project
  
  has_many :belows, class_name: "Context"
  has_many :overs, class_name: "Context"

  belongs_to :contextable, polymorphic: true
end
