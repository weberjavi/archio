class RemoveProjectFromTimberSheets < ActiveRecord::Migration
  def change
    remove_reference :timber_sheets, :project, index: true, foreign_key: true
  end
end
