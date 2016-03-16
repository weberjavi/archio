class CreateTimberSheets < ActiveRecord::Migration
  def change
    create_table :timber_sheets do |t|
      t.text :description
      t.string :species
      t.boolean :dendro_sample
      t.boolean :knotty
      t.boolean :bark
      t.boolean :sapwood

      t.timestamps null: false
    end
  end
end
