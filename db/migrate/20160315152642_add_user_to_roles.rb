class AddUserToRoles < ActiveRecord::Migration
  def change
    add_reference :roles, :user, index: true, foreign_key: true
  end
end
