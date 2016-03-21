class CreateProjectsAndUsers < ActiveRecord::Migration
  def change
    create_table :projects_and_users do |t|
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
    end
  end
end
