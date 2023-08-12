class CreatePersInMh < ActiveRecord::Migration[7.0]
  def change
    create_table :pers_in_mhs do |t|
      t.string :admitted_date, limit: nil
      t.string :no_of_days_in_mh, limit: nil
      t.string :diagonosis, limit: nil
      t.text :remarks, limit: nil      

      t.timestamps
    end
    add_reference :pers_in_mhs, :bn_nominal_rolls, foreign_key: true
  end
end
