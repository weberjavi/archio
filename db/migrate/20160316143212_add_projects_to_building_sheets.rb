class AddProjectsToBuildingSheets < ActiveRecord::Migration
  def change
    add_reference :building_sheets, :project, index: true, foreign_key: true
  end
end
