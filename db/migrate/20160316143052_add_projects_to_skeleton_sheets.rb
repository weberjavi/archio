class AddProjectsToSkeletonSheets < ActiveRecord::Migration
  def change
    add_reference :skeleton_sheets, :project, index: true, foreign_key: true
  end
end
