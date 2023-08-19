class CreateBnNominalRoll < ActiveRecord::Migration[7.0]
  def change
    create_table :bn_nominal_rolls do |t|
      t.string :army_no
      t.string :rank, limit: nil
      t.string :trade, limit: nil
      t.string :name, limit: nil
      t.string :date_of_tos_in_unit, limit: nil
      t.string :pers_med_cat, limit: nil
      t.string :coy, limit: nil
      t.string :civ_edn, limit: nil
      t.string :marital_status, limit: nil
      t.string :dob, limit: nil
      t.text :remarks, limit: nil
      t.timestamps
    end

    add_index :bn_nominal_rolls, :army_no
    add_index :bn_nominal_rolls, :coy
  end
end
