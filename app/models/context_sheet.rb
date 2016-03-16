class ContextSheet < ActiveRecord::Base
  belongs_to :project
  has_many :contexts, as: :contextable
end
