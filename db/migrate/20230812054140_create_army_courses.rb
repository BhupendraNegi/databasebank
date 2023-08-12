class CreateArmyCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :army_courses do |t|

      t.string :course, limit: nil
      t.string :course_grading, limit: nil
      t.string :location, limit: nil
      t.text :remarks, limit: nil      

      t.timestamps
    end
    add_reference :army_courses, :bn_nominal_rolls, foreign_key: true
  end
end
