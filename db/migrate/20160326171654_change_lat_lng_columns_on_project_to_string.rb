class ChangeLatLngColumnsOnProjectToString < ActiveRecord::Migration
  def change
    change_column :projects, :lat, :string
    change_column :projects, :lng, :string
  end
end
