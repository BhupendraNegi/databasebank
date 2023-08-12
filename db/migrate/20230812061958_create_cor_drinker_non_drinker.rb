class CreateCorDrinkerNonDrinker < ActiveRecord::Migration[7.0]
  def change
    create_table :cor_drinker_non_drinkers do |t|

      t.string :drinker_non_drinker, limit: nil
      t.text :remarks, limit: nil      

      t.timestamps
    end
    add_reference :cor_drinker_non_drinkers, :bn_nominal_rolls, foreign_key: true
  end
end
