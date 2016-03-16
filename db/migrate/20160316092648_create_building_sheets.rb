class CreateBuildingSheets < ActiveRecord::Migration
  def change
    create_table :building_sheets do |t|
      t.text :description
      t.string :substructure

      t.timestamps null: false
    end
  end
end
