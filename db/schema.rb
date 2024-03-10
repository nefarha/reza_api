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

ActiveRecord::Schema[7.1].define(version: 2024_03_10_194755) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password"
    t.string "account_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pesanans", force: :cascade do |t|
    t.string "nama_pemesan"
    t.bigint "nomor_pemesan"
    t.string "nama_rekening_pemesan"
    t.bigint "nomor_rekening_pemesan"
    t.integer "wisata"
    t.integer "rekening_penerima"
    t.integer "jumlah_ticket"
    t.string "total_harga"
    t.string "image"
    t.integer "owner_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "creator"
    t.text "nama_bank_pemesan"
  end

  create_table "rekenings", force: :cascade do |t|
    t.string "name"
    t.string "bank_name"
    t.string "owner_id"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password"
    t.string "account_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wisata", force: :cascade do |t|
    t.string "nama_wisata"
    t.integer "harga"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
