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

ActiveRecord::Schema[7.0].define(version: 2023_02_20_093943) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expenses", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_expenses_on_author_id"
  end

  create_table "group_expenses", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "expense_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_group_expenses_on_expense_id"
    t.index ["group_id"], name: "index_group_expenses_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "icon", default: "https://th.bing.com/th/id/R.bbd92d64f5c944c8deb186f221857c0e?rik=qkpNCm0avpbgcA&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_317099.png&ehk=ku2fAarDstuuq2N4Mi6LoH%2b2xZf0aTKTtW5FHlDfymE%3d&risl=&pid=ImgRaw&r=0"
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_groups_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "expenses", "users", column: "author_id"
  add_foreign_key "group_expenses", "expenses"
  add_foreign_key "group_expenses", "groups"
  add_foreign_key "groups", "users", column: "author_id"
end