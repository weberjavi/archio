class RemoveProjectFromBuildingSheets < ActiveRecord::Migration
  def change
    remove_reference :building_sheets, :project, index: true, foreign_key: true
  end
end
