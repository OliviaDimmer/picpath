class AddDeskToShoot < ActiveRecord::Migration[6.0]
  def change
    add_column :shoots, :desk, :string
  end
end
