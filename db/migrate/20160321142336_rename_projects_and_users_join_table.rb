class RenameProjectsAndUsersJoinTable < ActiveRecord::Migration
  def self.up
    rename_table :projects_and_users, :projects_users
  end

  def self.down
    rename_table :projects_users, :projects_and_users
  end
end
