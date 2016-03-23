class RemoveContextableColumnsFromSkeleton < ActiveRecord::Migration
  def change
    remove_column :skeleton_sheets, :contextable_id
    remove_column :skeleton_sheets, :contextable_type
  end
end
