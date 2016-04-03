class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :contexts, :plans do |t|
      t.index [:context_id, :plan_id]
      t.index [:plan_id, :context_id]
    end
  end
end
