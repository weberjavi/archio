class AddChronologyToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :later_chronology, :integer
    add_column :projects, :earlier_chronology, :integer
  end
end
