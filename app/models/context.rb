class Context < ActiveRecord::Base
  belongs_to :contextable, polymorphic: true
end
