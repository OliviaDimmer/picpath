class AddAssignedUserToShoot < ActiveRecord::Migration[6.0]
  def change
    add_column :shoots, :user_assigned, :string
  end
end
