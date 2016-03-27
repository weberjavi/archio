class CreateFindBags < ActiveRecord::Migration
  def change
    create_table :find_bags do |t|
      t.string :token
      t.datetime :date
      t.timestamps null: false
    end
  end
end
