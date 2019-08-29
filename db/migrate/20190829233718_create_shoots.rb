class CreateShoots < ActiveRecord::Migration[6.0]
  def change
    create_table :shoots do |t|
      t.string :slug
      t.string :assignment_description
      t.datetime :start
      t.datetime :end
      t.string :location
      t.string :contact_name
      t.string :contact_phone
      t.datetime :deadline

      t.timestamps
    end
  end
end
