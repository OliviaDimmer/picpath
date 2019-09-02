class AddUserIdToShoots < ActiveRecord::Migration[6.0]
  def change
    add_reference :shoots, :user, foreign_key: true
  end
end
