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

ActiveRecord::Schema.define(version: 20160118020827) do

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "movie_id",   limit: 4
    t.string   "comment",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "comments", ["movie_id"], name: "index_comments_on_movie_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "halls", force: :cascade do |t|
    t.integer  "seat_id",      limit: 4
    t.integer  "numberChairP", limit: 4,   default: 0
    t.integer  "numberChairG", limit: 4,   default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "name",         limit: 255
  end

  add_index "halls", ["seat_id"], name: "index_halls_on_seat_id", using: :btree

  create_table "horaries", force: :cascade do |t|
    t.date     "begin"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "horaryname", limit: 255
    t.time     "hourBegin"
    t.time     "hourEnd"
  end

  create_table "movies", force: :cascade do |t|
    t.integer  "horary_id",     limit: 4
    t.integer  "hall_id",       limit: 4
    t.integer  "quality_id",    limit: 4
    t.string   "name",          limit: 255
    t.integer  "duration",      limit: 4,                  default: 0
    t.string   "information",   limit: 255
    t.decimal  "priceGeneral",              precision: 10, default: 0
    t.decimal  "pricePopular",              precision: 10, default: 0
    t.integer  "pointsGeneral", limit: 4,                  default: 0
    t.integer  "pountsPopular", limit: 4,                  default: 0
    t.integer  "setPoints",     limit: 4,                  default: 0
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "image",         limit: 255
  end

  add_index "movies", ["hall_id"], name: "index_movies_on_hall_id", using: :btree
  add_index "movies", ["horary_id"], name: "index_movies_on_horary_id", using: :btree
  add_index "movies", ["quality_id"], name: "index_movies_on_quality_id", using: :btree

  create_table "qualities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "seats", force: :cascade do |t|
    t.string   "addres",     limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "socios", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "document",     limit: 255
    t.string   "lastName",     limit: 255
    t.string   "email",        limit: 255
    t.string   "password",     limit: 255
    t.integer  "numberPoints", limit: 4,   default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "movie_id",      limit: 4
    t.integer  "amountGeneral", limit: 4, default: 0
    t.integer  "amountPopular", limit: 4, default: 0
    t.integer  "totalPrice",    limit: 4, default: 0
    t.boolean  "wayPAy",                  default: false
    t.integer  "name",          limit: 4, default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "tickets", ["movie_id"], name: "index_tickets_on_movie_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "document",               limit: 255
    t.string   "lastName",               limit: 255
    t.integer  "numberPoint",            limit: 4,   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "comments", "movies"
  add_foreign_key "comments", "users"
  add_foreign_key "halls", "seats"
  add_foreign_key "movies", "halls"
  add_foreign_key "movies", "horaries"
  add_foreign_key "movies", "qualities"
  add_foreign_key "tickets", "movies"
  add_foreign_key "tickets", "users"
end
