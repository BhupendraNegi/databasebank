class CreateCoyLeaveDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :coy_leave_details do |t|
      t.integer :al
      t.integer :cl
      t.text :remarks, limit: nil

      t.timestamps
    end
    add_reference :coy_leave_details, :bn_nominal_rolls, foreign_key: true
  end
end
