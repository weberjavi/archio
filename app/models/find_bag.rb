class FindBag < ActiveRecord::Base
	belongs_to :context
  has_many :finds
end
