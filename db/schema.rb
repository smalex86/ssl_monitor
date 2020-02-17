# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_17_071342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certificates", comment: "Таблица сертификатов", force: :cascade do |t|
    t.string "domain", comment: "Домен, для которого выполняется проверка серта"
    t.integer "status", comment: "Код статуса проверки сертификата"
    t.string "error", comment: "Текст ошибки"
    t.datetime "checked_at", comment: "Дата последней проверки"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["domain"], name: "index_certificates_on_domain", unique: true
  end

end
