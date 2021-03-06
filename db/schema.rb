# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_18_001452) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_ideas", force: :cascade do |t|
    t.integer "user_id"
    t.integer "idea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.index ["idea_id"], name: "index_favorite_ideas_on_idea_id"
    t.index ["user_id"], name: "index_favorite_ideas_on_user_id"
  end

  create_table "ideas", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "estimated_project_time"
    t.decimal "initial_investment_value"
    t.integer "estimated_time_to_profit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_ideas_on_category_id"
    t.index ["user_id"], name: "index_ideas_on_user_id"
  end

  create_table "investment_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invites", force: :cascade do |t|
    t.string "name"
    t.string "linkedin"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.text "doubts"
    t.text "details"
    t.integer "investment_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "idea_id"
    t.integer "user_id"
    t.index ["idea_id"], name: "index_proposals_on_idea_id"
    t.index ["investment_type_id"], name: "index_proposals_on_investment_type_id"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "document"
    t.string "linkedin"
    t.date "birth_day"
    t.float "amount_available_to_invest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
