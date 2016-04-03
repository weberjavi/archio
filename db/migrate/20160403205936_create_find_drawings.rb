class CreateFindDrawings < ActiveRecord::Migration
  def change
    create_table :find_drawings do |t|

      t.timestamps null: false
    end
  end
end
