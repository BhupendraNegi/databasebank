class CreateMaxHealthReport < ActiveRecord::Migration[7.0]
  def change
    create_table :max_health_reports do |t|

      t.string :barcode, limit: nil
      t.string :ht, limit: nil
      t.string :wt, limit: nil
      t.string :bp, limit: nil
      t.string :haemoglobin, limit: nil
      t.string :leucocyte, limit: nil
      t.string :neutrophiles, limit: nil
      t.string :lymphocytes, limit: nil
      t.string :monocytes, limit: nil
      t.string :eosinophiles, limit: nil
      t.string :basophiles, limit: nil
      t.string :glucose, limit: nil
      t.string :hbaglycosylated, limit: nil
      t.string :thyroid, limit: nil
      t.string :urea, limit: nil
      t.string :creatinine, limit: nil
      t.string :billirubin, limit: nil
      t.string :sgot, limit: nil
      t.string :sgpt, limit: nil
      t.string :cholesterol, limit: nil
      t.string :triglycerides, limit: nil
      t.string :spg, limit: nil
      t.text :remarks, limit: nil      

      t.timestamps
    end
    add_reference :max_health_reports, :bn_nominal_roll, foreign_key: true
  end
end
