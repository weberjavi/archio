class TimberSheet < ActiveRecord::Base
  has_one :context, as: :contextable, dependent: :destroy
  accepts_nested_attributes_for :context, allow_destroy: true
end
