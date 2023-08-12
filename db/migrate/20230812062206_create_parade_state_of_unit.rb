class CreateParadeStateOfUnit < ActiveRecord::Migration[7.0]
  def change
    create_table :parade_state_of_units do |t|
      t.string :designation, limit: nil
      t.integer :auth
      t.integer :posted
      t.integer :present
      t.timestamps
    end
  end
end
