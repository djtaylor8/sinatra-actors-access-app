class CreateAgents < ActiveRecord::Migration[6.0]
  def change
    create_table :agents do |t|
      t.string :name 
      t.string :email 
      t.string :password_digest 
    end
  end
end
