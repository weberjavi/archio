class AddContextToContextTypes < ActiveRecord::Migration
  def change
    add_reference :context_types, :context, index: true, foreign_key: true
  end
end
