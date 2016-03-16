class AddProjectsToContextSheets < ActiveRecord::Migration
  def change
    add_reference :context_sheets, :project, index: true, foreign_key: true
  end
end
