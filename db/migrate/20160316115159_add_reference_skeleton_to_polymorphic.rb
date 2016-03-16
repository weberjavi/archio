class AddReferenceSkeletonToPolymorphic < ActiveRecord::Migration
  def change
    change_table :skeleton_sheets do |t|
      t.references :contextable, :polymorphic => true
    end
  end
end
