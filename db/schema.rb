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

ActiveRecord::Schema.define(:version => 20110528084445) do

  create_table "strategies", :force => true do |t|
    t.string   "name"
    t.integer  "range_low"
    t.integer  "range_high"
    t.string   "league"
    t.string   "link"
    t.text     "build_order"
    t.text     "description"
    t.string   "race"
    t.string   "play_style"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
