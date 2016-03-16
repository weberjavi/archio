class MasonrySheet < ActiveRecord::Base
  has_many :contexts, as: :contextable
end
