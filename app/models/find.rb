class Find < ActiveRecord::Base
  belongs_to :find_bag
  has_one :find_drawing
end
