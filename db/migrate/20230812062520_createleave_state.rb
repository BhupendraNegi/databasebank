class CreateleaveState < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_states do |t|
      t.integer :al
      t.integer :cl
      t.string :furlough, limit: nil
      t.text :remarks, limit: nil      

      t.timestamps
    end
    add_reference :leave_states, :bn_nominal_rolls, foreign_key: true
  end
end
