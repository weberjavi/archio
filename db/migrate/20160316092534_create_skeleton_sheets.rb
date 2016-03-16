class CreateSkeletonSheets < ActiveRecord::Migration
  def change
    create_table :skeleton_sheets do |t|
      t.string :grave_type
      t.string :grave_cut
      t.string :grave_fill
      t.string :coffin
      t.string :orientation
      t.string :group
      t.string :burial_number
      t.string :provisional_period
      t.text :skeleton_description

      t.timestamps null: false
    end
  end
end
