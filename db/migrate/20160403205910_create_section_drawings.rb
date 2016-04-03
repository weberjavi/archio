class CreateSectionDrawings < ActiveRecord::Migration
  def change
    create_table :section_drawings do |t|

      t.timestamps null: false
    end
  end
end
