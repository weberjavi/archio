class AddPolymorphicReferencesToContextable < ActiveRecord::Migration
  def change
    change_table :contexts do |t|
      t.references :contextable, :polymorphic => true
    end
  end
end
