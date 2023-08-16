class CreateleaveState < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_states do |t|
      t.string :al
      t.string :cl
      t.string :furlough, limit: nil
      t.text :remarks, limit: nil      

      t.timestamps
    end
    add_reference :leave_states, :bn_nominal_roll, foreign_key: true
  end
end
