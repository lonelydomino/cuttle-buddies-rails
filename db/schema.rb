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

ActiveRecord::Schema.define(version: 2021_04_04_001119) do

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "birthday"
    t.string "gender"
    t.integer "age"
    t.string "password_digest"
    t.string "uid"
    t.string "provider"
    t.text "bio"
    t.integer "friendslist_id"
    t.integer "partnerslist_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friendslist_id"], name: "index_users_on_friendslist_id"
    t.index ["partnerslist_id"], name: "index_users_on_partnerslist_id"
  end

  add_foreign_key "users", "users", column: "friendslist_id"
  add_foreign_key "users", "users", column: "partnerslist_id"
end
