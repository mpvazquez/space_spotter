# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140407011605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: true do |t|
    t.integer  "customer_id"
    t.integer  "timeslot_id"
    t.text     "review_text"
    t.integer  "review_score"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", force: true do |t|
    t.string   "title"
    t.text     "listing_photo_url"
    t.text     "description"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.decimal  "rate"
    t.integer  "vendor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "customer_id"
    t.integer  "vendor_id"
    t.string   "review_subject"
    t.text     "review_text"
    t.integer  "review_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spot_mails", force: true do |t|
    t.integer  "customer_id"
    t.integer  "booking_id"
    t.string   "message_subject"
    t.text     "message_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timeslots", force: true do |t|
    t.date     "date"
    t.time     "start_time"
    t.time     "stop_time"
    t.boolean  "booked",     default: false
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.integer  "phone_number"
    t.text     "photo_url"
    t.text     "bio_text"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.string   "role",            default: "customer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
