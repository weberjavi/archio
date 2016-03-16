class AddProjectsToTimberSheets < ActiveRecord::Migration
  def change
    add_reference :timber_sheets, :project, index: true, foreign_key: true
  end
end
