class ContextSheet < ActiveRecord::Base
  has_one :context, through: :context_type
  has_one :context_type, as: :contextable
end
