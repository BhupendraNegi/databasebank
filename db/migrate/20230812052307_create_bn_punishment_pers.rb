class CreateBnPunishmentPers < ActiveRecord::Migration[7.0]
  def change
    create_table :bn_punishment_pers do |t|
      t.text :red_black, limit: nil
      t.string :duration_on_period, limit: nil
      t.string :army_act, limit: nil
      t.text :punishment_award_ed, limit: nil
      t.string :location, limit: nil
      t.text :remarks, limit: nil

      t.timestamps
    end
     add_reference :bn_punishment_pers, :bn_nominal_roll, foreign_key: true
  end
end
