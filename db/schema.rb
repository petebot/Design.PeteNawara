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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110227225538) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["name"], :name => "index_clients_on_name", :unique => true
  add_index "clients", ["url"], :name => "index_clients_on_url", :unique => true

  create_table "projects", :force => true do |t|
    t.integer "client_id"
    t.string  "title"
    t.text    "description"
    t.date    "start_date"
    t.date    "end_date"
    t.integer "priority",    :limit => 1
    t.string  "url"
  end

  add_index "projects", ["client_id"], :name => "index_projects_on_client_id"

  create_table "tools", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
