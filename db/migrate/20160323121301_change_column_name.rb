class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :contexts, :context, :ue
  end
end
