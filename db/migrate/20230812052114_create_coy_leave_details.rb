class CreateCoyLeaveDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :coy_leave_details do |t|
      t.string :al
      t.string :cl
      t.text :remarks, limit: nil

      t.timestamps
    end
    add_reference :coy_leave_details, :bn_nominal_roll, foreign_key: true
  end
end
