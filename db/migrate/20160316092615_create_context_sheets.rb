class CreateContextSheets < ActiveRecord::Migration
  def change
    create_table :context_sheets do |t|
      t.string :context_type
      t.text :description

      t.timestamps null: false
    end
  end
end
