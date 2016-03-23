class DropContextTypes < ActiveRecord::Migration
  def change
    drop_table :context_types
  end
end
