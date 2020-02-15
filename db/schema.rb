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

ActiveRecord::Schema.define(version: 2020_02_15_161158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certificate_status_history", comment: "Таблица истории проверки сертификатов", force: :cascade do |t|
    t.integer "certificate_id", comment: "Идентификатор сертификата"
    t.integer "status_code", comment: "Код статуса проверки"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "certificates", comment: "Таблица сертификатов", force: :cascade do |t|
    t.string "domain", comment: "Домен, для которого выполняется проверка серта"
    t.integer "status_code", comment: "Код статуса проверки сертификата"
    t.datetime "checked_at", comment: "Дата последней проверки"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "statuses", comment: "Таблица статусов проверки", force: :cascade do |t|
    t.integer "code", comment: "Код статуса"
    t.string "name", comment: "Название статуса"
    t.string "description", comment: "Описание статуса"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
