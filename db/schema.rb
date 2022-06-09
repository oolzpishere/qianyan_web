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

ActiveRecord::Schema[7.0].define(version: 2022_06_02_030648) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "role"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "attend_data", force: :cascade do |t|
    t.integer "conference_id"
    t.integer "jsj_form_id"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "school"
    t.string "province"
    t.string "location"
    t.string "way"
    t.string "occupation"
    t.string "openid"
    t.string "unionid"
    t.boolean "payed"
    t.boolean "allow_to_print"
    t.string "certification_number"
    t.string "cert_bg_type"
    t.string "group"
    t.integer "timestamp"
    t.integer "jsj_id"
    t.json "entry"
    t.boolean "deleted"
    t.string "trade_no"
    t.string "bank_transfer_confirm"
    t.string "jsj_created_at"
    t.string "jsj_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conferences", force: :cascade do |t|
    t.integer "subject_id"
    t.string "name"
    t.string "full_name"
    t.string "sms_conf_name"
    t.integer "year"
    t.string "season"
    t.string "subject_eng_name"
    t.string "type"
    t.date "start_date"
    t.date "finish_date"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identifies", force: :cascade do |t|
    t.integer "user_id"
    t.string "provider"
    t.string "uid"
    t.string "unionid"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["unionid"], name: "index_identifies_on_unionid", unique: true
    t.index ["user_id"], name: "index_identifies_on_user_id"
  end

  create_table "jsj_forms", force: :cascade do |t|
    t.integer "conference_id"
    t.string "form_identify"
    t.string "name"
    t.string "full_name"
    t.string "description"
    t.string "form_type"
    t.string "all_use_data_type"
    t.string "sign_up_link"
    t.json "form_struct"
    t.string "xml_fields"
    t.string "use_fields_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_identify"], name: "index_jsj_forms_on_form_identify", unique: true
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "eng_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "phone"
    t.string "username"
    t.string "avatar"
    t.string "motto"
    t.string "otp_secret_key"
    t.integer "otp_counter"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
