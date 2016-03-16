class CreateMasonrySheets < ActiveRecord::Migration
  def change
    create_table :masonry_sheets do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
