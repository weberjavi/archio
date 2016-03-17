class CreateContextTypes < ActiveRecord::Migration
  def change
    create_table :context_types do |t|
      t.references :contextable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
