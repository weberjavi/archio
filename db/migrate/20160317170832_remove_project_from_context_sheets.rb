class RemoveProjectFromContextSheets < ActiveRecord::Migration
  def change
    remove_reference :context_sheets, :project, index: true, foreign_key: true
  end
end
