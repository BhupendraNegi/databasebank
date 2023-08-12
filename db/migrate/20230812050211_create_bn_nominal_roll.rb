class CreateBnNominalRoll < ActiveRecord::Migration[7.0]
  def change
    create_table :bn_nominal_rolls do |t|
      t.integer :army_no
      t.string :rank, limit: nil
      t.string :trade, limit: nil
      t.string :name, limit: nil
      t.string :date_of_tos_in_unit, limit: nil
      t.string :coy, limit: nil
      t.string :civ_edn, limit: nil
      t.string :marital_status, limit: nil
      t.text :remarks, limit: nil

      t.timestamps
    end
  end
end
