class ContextType < ActiveRecord::Base
  belongs_to :context
  belongs_to :contextable, polymorphic: true
end
