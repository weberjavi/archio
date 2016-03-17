class RemoveProjectFromMasonrySheets < ActiveRecord::Migration
  def change
    remove_reference :masonry_sheets, :project, index: true, foreign_key: true
  end
end
