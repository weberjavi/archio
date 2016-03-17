class RemoveProjectFromSkeletonSheets < ActiveRecord::Migration
  def change
    remove_reference :skeleton_sheets, :project, index: true, foreign_key: true
  end
end
