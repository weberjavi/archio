class CreateFinds < ActiveRecord::Migration
  def change
    create_table :finds do |t|
      t.string :token

      t.timestamps null: false
    end
  end
end
