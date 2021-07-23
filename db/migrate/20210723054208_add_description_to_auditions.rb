class AddDescriptionToAuditions < ActiveRecord::Migration[6.0]
  def change
    add_column(:auditions, :description, :string)
  end
end
