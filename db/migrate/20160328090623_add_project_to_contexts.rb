class AddProjectToContexts < ActiveRecord::Migration
  def change
    add_reference :contexts, :project, index: true, foreign_key: true
  end
end
