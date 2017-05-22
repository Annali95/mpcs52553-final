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

ActiveRecord::Schema.define(version: 0) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.text   "mail"
    t.text   "password"
  end

  create_table "articles", force: :cascade do |t|
    t.text    "category"
    t.text    "title"
    t.text    "content"
    t.text    "post_time"
    t.integer "user_id"
    t.integer "like"
    t.text    "url"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "article_id"
    t.text    "content"
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "connections", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.text    "detail"
    t.index ["group_id"], name: "index_connections_on_group_id"
    t.index ["user_id"], name: "index_connections_on_user_id"
  end

  create_table "group_articles", force: :cascade do |t|
    t.integer "group_id"
    t.integer "article_id"
    t.index ["article_id"], name: "index_group_articles_on_article_id"
    t.index ["group_id"], name: "index_group_articles_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text   "create_time"
    t.text   "detail"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text   "mail"
    t.text   "password"
    t.text   "profile"
    t.       "admin"
  end

end
