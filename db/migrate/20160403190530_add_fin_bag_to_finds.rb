class AddFinBagToFinds < ActiveRecord::Migration
  def change
  	add_reference :finds, :find_bag, index: true, foreign_key: true
  end
end
