class CreateAwardsAndAchievement < ActiveRecord::Migration[7.0]
  def change
    create_table :awards_and_achievements do |t|

      t.string :awards, limit: nil
      t.string :awarding_date, limit: nil
      t.string :location, limit: nil
      t.text :remarks, limit: nil      

      t.timestamps
    end
    add_reference :awards_and_achievements, :bn_nominal_rolls, foreign_key: true
  end
end
