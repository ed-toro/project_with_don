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

ActiveRecord::Schema.define(version: 20171010194851) do

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.string "trello_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.date "due_by"
    t.integer "user_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "project_id", null: false
    t.boolean "owner"
    t.index ["user_id", "project_id"], name: "index_projects_users_on_user_id_and_project_id"
  end

  create_table "repos", force: :cascade do |t|
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "github_id"
    t.string "name"
    t.index ["project_id"], name: "index_repos_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "trello_id"
    t.string "slack_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "github_id"
    t.string "email"
    t.string "github_oauth"
    t.string "trello_oauth"
    t.string "trello_oauth_verifier"
    t.string "trello_member_token"
    t.string "trello_member_secret"
    t.index ["trello_id"], name: "index_users_on_trello_id", unique: true
  end

end
