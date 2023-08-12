class CreateBnSportsTeam < ActiveRecord::Migration[7.0]
  def change
    create_table :bn_sports_teams do |t|
      t.string :game_level, limit: nil
      t.text :game, limit: nil 
      t.text :remarks, limit: nil      

      t.timestamps
    end
    add_reference :bn_sports_teams, :bn_nominal_rolls, foreign_key: true
  end
end
