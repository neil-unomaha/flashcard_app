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

ActiveRecord::Schema.define(version: 2021_02_24_031456) do

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.integer "domain_id", null: false
    t.integer "category_id", null: false
    t.text "question"
    t.text "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_cards_on_category_id"
    t.index ["domain_id"], name: "index_cards_on_domain_id"
  end

  create_table "cards_tags", force: :cascade do |t|
    t.integer "card_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_cards_tags_on_card_id"
    t.index ["tag_id"], name: "index_cards_tags_on_tag_id"
  end

  create_table "cards_tests", force: :cascade do |t|
    t.integer "card_id", null: false
    t.integer "test_id", null: false
    t.boolean "correct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_cards_tests_on_card_id"
    t.index ["test_id"], name: "index_cards_tests_on_test_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "domain_id"
    t.index ["domain_id"], name: "index_categories_on_domain_id"
  end

  create_table "domains", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tests", force: :cascade do |t|
    t.boolean "question_first"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cards", "categories"
  add_foreign_key "cards", "domains"
  add_foreign_key "cards_tags", "cards"
  add_foreign_key "cards_tags", "tags"
  add_foreign_key "cards_tests", "cards"
  add_foreign_key "cards_tests", "tests"
end
