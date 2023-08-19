class AddColumnToBnNominalRoll < ActiveRecord::Migration[7.0]
  def change
    add_column :bn_nominal_rolls, :pers_med_cat, :string
  end
end
