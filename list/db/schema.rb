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

ActiveRecord::Schema.define(version: 2019_07_31_031456) do

  create_table "default_lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "default_lists_users", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "default_list_id"
    t.bigint "user_id"
    t.index ["default_list_id", "user_id"], name: "index_default_lists_users_on_default_list_id_and_user_id"
    t.index ["default_list_id"], name: "index_default_lists_users_on_default_list_id"
    t.index ["user_id"], name: "index_default_lists_users_on_user_id"
  end

  create_table "list_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "value", limit: 500
    t.boolean "checked", default: false, null: false
    t.date "dueDate"
    t.bigint "default_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["default_list_id"], name: "index_list_items_on_default_list_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", default: "", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "default_lists_users", "default_lists"
  add_foreign_key "default_lists_users", "users"
  add_foreign_key "list_items", "default_lists"
end
