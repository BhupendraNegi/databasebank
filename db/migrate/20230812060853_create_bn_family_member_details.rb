class CreateBnFamilyMemberDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :bn_family_member_details do |t|

      t.string :wife_name, limit: nil
      t.string :dob_wife, limit: nil
      t.string :no_of_children, limit: nil
      t.text :present_address, limit: nil
      t.text :permanent_address, limit: nil
      t.string :qtr_occupation_date, limit: nil
      t.text :family_problem, limit: nil
      t.string :mob_no_indl, limit: nil
      t.string :mob_no_res, limit: nil

      t.text :remarks, limit: nil      

      t.timestamps
    end
    add_reference :bn_family_member_details, :bn_nominal_roll, foreign_key: true
    add_reference :bn_family_member_details, :indl_detail, foreign_key: true
  end
end
