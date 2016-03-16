class CreateContexts < ActiveRecord::Migration
  def change
    create_table :contexts do |t|
      t.text :interpretation
      t.text :discussion
      t.string :site_code
      t.string :area
      t.string :context
      t.datetime :date
      t.string :recorded_by
      t.string :below
      t.string :above
      t.string :section
      t.string :trench


      t.timestamps null: false
    end
  end
end
