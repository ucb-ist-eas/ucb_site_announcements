# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_12_06_192929) do
  create_table "ucb_site_announcements_announcements", force: :cascade do |t|
    t.string "message", null: false
    t.string "category", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean "enabled", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_time"], name: "index_ucb_site_announcements_announcements_on_end_time"
    t.index ["start_time"], name: "index_ucb_site_announcements_announcements_on_start_time"
  end

end
