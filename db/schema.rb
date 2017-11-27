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

ActiveRecord::Schema.define(version: 20171127132638) do

  create_table "bookings", force: :cascade do |t|
    t.integer "User_id"
    t.integer "quantity"
    t.float "price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["User_id"], name: "index_bookings_on_User_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "User_id"
    t.integer "PostReview_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["PostReview_id"], name: "index_comments_on_PostReview_id"
    t.index ["User_id"], name: "index_comments_on_User_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "name"
    t.integer "run_time"
    t.string "link_trailer"
    t.string "image"
    t.float "avg_rate", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_reviews", force: :cascade do |t|
    t.integer "User_id"
    t.integer "Film_id"
    t.string "title"
    t.text "content"
    t.boolean "approve"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Film_id"], name: "index_post_reviews_on_Film_id"
    t.index ["User_id"], name: "index_post_reviews_on_User_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "Film_id"
    t.integer "User_id"
    t.integer "mark", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Film_id"], name: "index_ratings_on_Film_id"
    t.index ["User_id"], name: "index_ratings_on_User_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.string "email"
    t.datetime "dob"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "watching_times", force: :cascade do |t|
    t.integer "Film_id"
    t.integer "Booking_id"
    t.datetime "time_begin"
    t.date "day_watching"
    t.integer "total_ticket"
    t.integer "remaining_ticket"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Booking_id"], name: "index_watching_times_on_Booking_id"
    t.index ["Film_id"], name: "index_watching_times_on_Film_id"
  end

end
