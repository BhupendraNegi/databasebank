class CreateIndlVehDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :indl_veh_details do |t|

      t.string :type_of_veh, limit: nil
      t.string :veh_no, limit: nil
      t.string :location, limit: nil
      t.text :remarks, limit: nil      

      t.timestamps
    end
    add_reference :indl_veh_details, :bn_nominal_roll, foreign_key: true
  end
end
