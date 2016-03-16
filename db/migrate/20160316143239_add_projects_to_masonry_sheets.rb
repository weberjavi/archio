class AddProjectsToMasonrySheets < ActiveRecord::Migration
  def change
    add_reference :masonry_sheets, :project, index: true, foreign_key: true
  end
end
