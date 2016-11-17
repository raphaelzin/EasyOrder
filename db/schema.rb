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

ActiveRecord::Schema.define(version: 20161117174324) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.integer  "fbid"
    t.integer  "table_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "uid"
    t.boolean  "checking_out"
    t.boolean  "done"
    t.string   "payment_method"
    t.index ["table_id"], name: "index_clients_on_table_id"
  end

  create_table "clients_dishes", id: false, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "dish_id",   null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "title"
    t.float    "price"
    t.string   "description"
    t.string   "observation"
    t.integer  "category_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.index ["category_id"], name: "index_dishes_on_category_id"
  end

  create_table "dishes_orders", id: false, force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "dish_id",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "waiter_id"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["waiter_id"], name: "index_orders_on_waiter_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tables", force: :cascade do |t|
    t.string   "code"
    t.integer  "number"
    t.integer  "waiter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "requested"
    t.index ["waiter_id"], name: "index_tables_on_waiter_id"
  end

  create_table "waiters", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "phone"
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
