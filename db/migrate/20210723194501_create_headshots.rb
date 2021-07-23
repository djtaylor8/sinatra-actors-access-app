class CreateHeadshots < ActiveRecord::Migration[6.0]
  def change
    create_table :headshots do |t|
      t.string :name 
      t.string :path 
      t.integer :actor_id 
    end
  end
end
