class CreateActorAuditions < ActiveRecord::Migration[6.0]
  def change
    create_table :actor_auditions do |t|
      t.integer :actor_id 
      t.integer :audition_id 
    end
  end
end
