class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.string :token
      t.references :context

      t.timestamps null: false
    end
  end
end
