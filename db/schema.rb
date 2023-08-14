# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_12_062828) do
  create_table "army_courses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "course"
    t.string "course_grading"
    t.string "location"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bn_nominal_rolls_id"
    t.index ["bn_nominal_rolls_id"], name: "index_army_courses_on_bn_nominal_rolls_id"
  end

  create_table "att_pers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "unit"
    t.string "unit_location"
    t.string "att_as_on"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bn_nominal_rolls_id"
    t.index ["bn_nominal_rolls_id"], name: "index_att_pers_on_bn_nominal_rolls_id"
  end

  create_table "awards_and_achievements", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "awards"
    t.string "awarding_date"
    t.string "location"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bn_nominal_rolls_id"
    t.index ["bn_nominal_rolls_id"], name: "index_awards_and_achievements_on_bn_nominal_rolls_id"
  end

  create_table "bn_family_member_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "wife_name"
    t.string "dob_wife"
    t.string "no_of_children"
    t.text "present_address"
    t.text "permanent_address"
    t.string "qtr_occupation_date"
    t.text "family_problem"
    t.string "mob_no_indl"
    t.string "mob_no_res"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bn_nominal_rolls_id"
    t.bigint "indl_details_id"
    t.index ["bn_nominal_rolls_id"], name: "index_bn_family_member_details_on_bn_nominal_rolls_id"
    t.index ["indl_details_id"], name: "index_bn_family_member_details_on_indl_details_id"
  end

  create_table "bn_lmc_pers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "diagonosis"
    t.string "date_of_first_placed_in_lmc"
    t.string "date_of_next_med_review"
    t.string "location"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bn_nominal_rolls_id"
    t.index ["bn_nominal_rolls_id"], name: "index_bn_lmc_pers_on_bn_nominal_rolls_id"
  end

  create_table "bn_nominal_rolls", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "army_no"
    t.string "rank"
    t.string "trade"
    t.string "name"
    t.string "date_of_tos_in_unit"
    t.string "coy"
    t.string "civ_edn"
    t.string "marital_status"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bn_punishment_pers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "red_black"
    t.string "duration_on_period"
    t.string "army_act"
    t.text "punishment_award_ed"
    t.string "location"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bn_nominal_rolls_id"
    t.index ["bn_nominal_rolls_id"], name: "index_bn_punishment_pers_on_bn_nominal_rolls_id"
  end

  create_table "bn_sports_teams", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "game_level"
    t.text "game"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bn_nominal_rolls_id"
    t.index ["bn_nominal_rolls_id"], name: "index_bn_sports_teams_on_bn_nominal_rolls_id"
  end

  create_table "cor_drinker_non_drinkers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "drinker_non_drinker"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bn_nominal_rolls_id"
    t.index ["bn_nominal_rolls_id"], name: "index_cor_drinker_non_drinkers_on_bn_nominal_rolls_id"
  end

  create_table "coy_leave_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "al"
    t.string "cl"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bn_nominal_rolls_id"
    t.index ["bn_nominal_rolls_id"], name: "index_coy_leave_details_on_bn_nominal_rolls_id"
  end

  create_table "ere_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "ere_unit"
    t.string "ere_location"
    t.string "date_of_sos_to_ere"
    t.string "date_of_rtu_to_unit"
    t.string "tenure"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bn_nominal_rolls_id"
    t.index ["bn_nominal_rolls_id"], name: "index_ere_details_on_bn_nominal_rolls_id"
  end

  create_table "indl_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "pl"
    t.string "sec"
    t.string "i_card_number"
    t.string "blood_group"
    t.string "appt"
    t.string "dob"
    t.string "dt_of_enrollment"
    t.string "dt_of_tos_in_unit"
    t.string "dt_of_marriage"
    t.string "dscp_record"
    t.string "mob_no_indl"
    t.string "mob_no_res"
    t.string "pan_no"
    t.string "uid_no"
    t.string "lve_plan"
    t.string "location"
    t.string "email_id"
    t.text "address"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bn_nominal_rolls_id"
    t.index ["bn_nominal_rolls_id"], name: "index_indl_details_on_bn_nominal_rolls_id"
  end

  create_table "indl_veh_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "type_of_veh"
    t.string "veh_no"
    t.string "location"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bn_nominal_rolls_id"
    t.index ["bn_nominal_rolls_id"], name: "index_indl_veh_details_on_bn_nominal_rolls_id"
  end

  create_table "leave_states", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "al"
    t.string "cl"
    t.string "furlough"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bn_nominal_rolls_id"
    t.index ["bn_nominal_rolls_id"], name: "index_leave_states_on_bn_nominal_rolls_id"
  end

  create_table "max_health_reports", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "barcode"
    t.string "ht"
    t.string "wt"
    t.string "bp"
    t.string "haemoglobin"
    t.string "leucocyte"
    t.string "neutrophiles"
    t.string "lymphocytes"
    t.string "monocytes"
    t.string "eosinophiles"
    t.string "basophiles"
    t.string "glucose"
    t.string "hbaglycosylated"
    t.string "thyroid"
    t.string "urea"
    t.string "creatinine"
    t.string "billirubin"
    t.string "sgot"
    t.string "sgpt"
    t.string "cholesterol"
    t.string "triglycerides"
    t.string "spg"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bn_nominal_rolls_id"
    t.index ["bn_nominal_rolls_id"], name: "index_max_health_reports_on_bn_nominal_rolls_id"
  end

  create_table "parade_state_of_units", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "designation"
    t.integer "auth"
    t.integer "posted"
    t.integer "present"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pers_in_mhs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "admitted_date"
    t.string "no_of_days_in_mh"
    t.string "diagonosis"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bn_nominal_rolls_id"
    t.index ["bn_nominal_rolls_id"], name: "index_pers_in_mhs_on_bn_nominal_rolls_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "army_courses", "bn_nominal_rolls", column: "bn_nominal_rolls_id"
  add_foreign_key "att_pers", "bn_nominal_rolls", column: "bn_nominal_rolls_id"
  add_foreign_key "awards_and_achievements", "bn_nominal_rolls", column: "bn_nominal_rolls_id"
  add_foreign_key "bn_family_member_details", "bn_nominal_rolls", column: "bn_nominal_rolls_id"
  add_foreign_key "bn_family_member_details", "indl_details", column: "indl_details_id"
  add_foreign_key "bn_lmc_pers", "bn_nominal_rolls", column: "bn_nominal_rolls_id"
  add_foreign_key "bn_punishment_pers", "bn_nominal_rolls", column: "bn_nominal_rolls_id"
  add_foreign_key "bn_sports_teams", "bn_nominal_rolls", column: "bn_nominal_rolls_id"
  add_foreign_key "cor_drinker_non_drinkers", "bn_nominal_rolls", column: "bn_nominal_rolls_id"
  add_foreign_key "coy_leave_details", "bn_nominal_rolls", column: "bn_nominal_rolls_id"
  add_foreign_key "ere_details", "bn_nominal_rolls", column: "bn_nominal_rolls_id"
  add_foreign_key "indl_details", "bn_nominal_rolls", column: "bn_nominal_rolls_id"
  add_foreign_key "indl_veh_details", "bn_nominal_rolls", column: "bn_nominal_rolls_id"
  add_foreign_key "leave_states", "bn_nominal_rolls", column: "bn_nominal_rolls_id"
  add_foreign_key "max_health_reports", "bn_nominal_rolls", column: "bn_nominal_rolls_id"
  add_foreign_key "pers_in_mhs", "bn_nominal_rolls", column: "bn_nominal_rolls_id"
end
