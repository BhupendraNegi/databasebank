class AddIndexToBnNominalRoll < ActiveRecord::Migration[7.0]
  def change
    add_index :bn_nominal_rolls, :army_no
    add_index :bn_nominal_rolls, :coy
  end
end
