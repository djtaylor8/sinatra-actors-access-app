class AddAgentIdToAuditions < ActiveRecord::Migration[6.0]
  def change
    add_column(:auditions, :agent_id, :integer)
  end
end
