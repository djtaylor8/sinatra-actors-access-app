class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :name 
      t.string :email 
      t.string :password_digest 
      t.string :bio
      t.integer :agent_id 
    end 
  end
end
