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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120607192748) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image_url"
  end

  create_table "document_requests", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "document_id"
    t.integer  "tote_id"
    t.integer  "requestor_id"
  end

  add_index "document_requests", ["document_id"], :name => "index_document_requests_on_document_id"

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "documents", ["category_id"], :name => "index_documents_on_category_id"

  create_table "requestors", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "requestors", ["email"], :name => "index_requestors_on_email", :unique => true

  create_table "totes", :force => true do |t|
    t.string   "owner"
    t.string   "owner_comments"
    t.string   "customer_comments"
    t.integer  "requestor_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
