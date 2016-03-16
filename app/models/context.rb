class Context < ActiveRecord::Base
  belongs_to :project
  belongs_to :contextable, polymorphic: true
end
