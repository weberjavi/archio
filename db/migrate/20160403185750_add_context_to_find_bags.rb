class AddContextToFindBags < ActiveRecord::Migration
  def change
  	add_reference :find_bags, :context, index: true, foreign_key: true
  end
end
