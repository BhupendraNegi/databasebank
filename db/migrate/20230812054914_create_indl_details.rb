class CreateIndlDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :indl_details do |t|

      t.string :pl, limit: nil
      t.string :sec, limit: nil
      t.string :i_card_number, limit: nil
      t.string :blood_group, limit: nil
      t.string :appt, limit: nil
      t.string :dob, limit: nil
      t.string :dt_of_enrollment, limit: nil
      t.string :dt_of_tos_in_unit, limit: nil
      t.string :dt_of_marriage, limit: nil
      t.string :dscp_record, limit: nil
      t.string :mob_no_indl, limit: nil
      t.string :mob_no_res, limit: nil
      t.string :pan_no, limit: nil
      t.string :uid_no, limit: nil
      t.string :lve_plan, limit: nil
      t.string :location, limit: nil
      t.string :email_id
      t.text :address, limit: nil


      t.text :remarks, limit: nil      

      t.timestamps
    end
    add_reference :indl_details, :bn_nominal_roll, foreign_key: true
  end
end
