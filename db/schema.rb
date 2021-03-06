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

ActiveRecord::Schema.define(version: 2021_09_21_183926) do

  create_table "applications", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "phone"
    t.text "address"
    t.text "designation", default: "--- []\n"
    t.text "exam", default: "--- []\n"
    t.string "university1"
    t.string "degree1"
    t.string "major1"
    t.string "minor1"
    t.integer "gradyr1"
    t.string "university2"
    t.string "degree2"
    t.string "major2"
    t.string "minor2"
    t.integer "gradyr2"
    t.string "status"
    t.boolean "progint"
    t.integer "appid"
    t.text "recruiternotes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "designations", force: :cascade do |t|
    t.string "code"
    t.string "designation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exams", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "status"
    t.string "designation"
    t.integer "tracks_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tracks_id"], name: "index_exams_on_tracks_id"
  end

  create_table "openings", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "geid"
    t.boolean "program"
    t.text "description"
    t.text "responsibility"
    t.text "qualification"
    t.text "level", default: "--- []\n"
    t.string "position"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string "geid"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.integer "designation_id"
    t.string "des1"
    t.integer "year1"
    t.string "des2"
    t.integer "year2"
    t.string "des3"
    t.integer "year3"
    t.string "des4"
    t.integer "year4"
    t.text "globcom"
    t.text "confcom"
    t.string "manfn"
    t.string "manln"
    t.string "manemail"
    t.string "offfn"
    t.string "offln"
    t.string "offemail"
    t.string "title"
    t.string "lob"
    t.string "sublob"
    t.string "dep"
    t.string "div"
    t.string "subdiv"
    t.string "sec"
    t.string "location"
    t.date "hire"
    t.date "program"
    t.boolean "participant"
    t.boolean "employee"
    t.date "term"
    t.string "replace"
    t.date "examstd"
    t.decimal "passrate"
    t.string "fsa"
    t.integer "datayr"
    t.integer "salaryc"
    t.integer "salaryc1"
    t.integer "salaryc2"
    t.integer "salaryc3"
    t.integer "bonus"
    t.integer "bonus1"
    t.integer "bonus2"
    t.integer "bonus3"
    t.string "rating"
    t.string "rating1"
    t.string "rating2"
    t.string "rating3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["designation_id"], name: "index_participants_on_designation_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
