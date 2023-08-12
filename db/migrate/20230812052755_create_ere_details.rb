class CreateEreDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :ere_details do |t|
      t.string :ere_unit, limit: nil
      t.string :ere_location, limit: nil
      t.string :date_of_sos_to_ere, limit: nil
      t.string :date_of_rtu_to_unit, limit: nil
      t.string :tenure, limit: nil
      t.text :remarks, limit: nil

      t.timestamps
    end
    add_reference :ere_details, :bn_nominal_rolls, foreign_key: true
  end
end
