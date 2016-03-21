class MasonrySheet < ActiveRecord::Base
  has_one :context, as: :contextable
  accepts_nested_attributes_for :contextable
end
