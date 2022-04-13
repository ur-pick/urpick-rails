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

ActiveRecord::Schema.define(version: 2022_04_13_172150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friend_invitations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "friend_id"
    t.boolean "confirmed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_friend_invitations_on_user_id"
  end

  create_table "invites", force: :cascade do |t|
    t.integer "status", default: 1, null: false
    t.bigint "user_id", null: false
    t.bigint "meetup_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meetup_id"], name: "index_invites_on_meetup_id"
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "meetups", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_meetups_on_user_id"
  end

  create_table "place_candidates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "meetup_id", null: false
    t.bigint "place_id", null: false
    t.boolean "is_chosen", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meetup_id"], name: "index_place_candidates_on_meetup_id"
    t.index ["place_id"], name: "index_place_candidates_on_place_id"
    t.index ["user_id"], name: "index_place_candidates_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "longitude"
    t.float "latitude"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "meetup_id"
    t.bigint "place_candidate_id", null: false
    t.bigint "invite_id", null: false
    t.index ["invite_id"], name: "index_votes_on_invite_id"
    t.index ["meetup_id"], name: "index_votes_on_meetup_id"
    t.index ["place_candidate_id"], name: "index_votes_on_place_candidate_id"
  end

  add_foreign_key "friend_invitations", "users"
  add_foreign_key "invites", "meetups"
  add_foreign_key "invites", "users"
  add_foreign_key "meetups", "users"
  add_foreign_key "place_candidates", "meetups"
  add_foreign_key "place_candidates", "places"
  add_foreign_key "place_candidates", "users"
  add_foreign_key "votes", "invites"
  add_foreign_key "votes", "meetups"
  add_foreign_key "votes", "place_candidates"
end
