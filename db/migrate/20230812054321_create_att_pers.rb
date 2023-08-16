class CreateAttPers < ActiveRecord::Migration[7.0]
  def change
    create_table :att_pers do |t|

      t.string :unit, limit: nil
      t.string :unit_location, limit: nil
      t.string :att_as_on, limit: nil
      t.text :remarks, limit: nil      

      t.timestamps
    end
    add_reference :att_pers, :bn_nominal_roll, foreign_key: true
  end
end
