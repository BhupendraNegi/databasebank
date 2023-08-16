class CreateBnLmcPers < ActiveRecord::Migration[7.0]
  def change
    create_table :bn_lmc_pers do |t|
      t.text :diagonosis, limit: nil
      t.string :date_of_first_placed_in_lmc, limit: nil
      t.string :date_of_next_med_review, limit: nil
      t.string :location,  limit: nil
      t.text :remarks, limit: nil

      t.timestamps
    end
    add_reference :bn_lmc_pers, :bn_nominal_roll, foreign_key: true
  end
end
