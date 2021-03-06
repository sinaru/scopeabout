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

ActiveRecord::Schema.define(version: 2019_03_26_220514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "organization_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "description"
    t.string "interests"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "current_job"
    t.bigint "organization_id"
    t.index ["email"], name: "index_organization_users_on_email"
    t.index ["organization_id"], name: "index_organization_users_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "subdomain", limit: 32
    t.string "name"
    t.integer "owner_id"
    t.index ["subdomain"], name: "index_organizations_on_subdomain", unique: true
  end

  create_table "session_feeds", force: :cascade do |t|
    t.text "body"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "description"
    t.string "interests"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "current_job"
    t.string "current_organization"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "organization_users", "organizations"
end
