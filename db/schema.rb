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

ActiveRecord::Schema[7.0].define(version: 2023_09_21_061021) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advanced_datas", force: :cascade do |t|
    t.integer "industry_id"
    t.boolean "slogan_exists"
    t.boolean "icon_selected"
    t.integer "template_id"
    t.integer "sales_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["icon_selected"], name: "index_advanced_datas_on_icon_selected"
    t.index ["industry_id"], name: "index_advanced_datas_on_industry_id"
    t.index ["slogan_exists"], name: "index_advanced_datas_on_slogan_exists"
    t.index ["template_id"], name: "index_advanced_datas_on_template_id"
  end

  create_table "company_length_datas", force: :cascade do |t|
    t.integer "template_id", null: false
    t.integer "company_name_length_min", default: 0, null: false
    t.integer "company_name_length_max", default: 0, null: false
    t.integer "sales_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_name_length_max"], name: "index_company_length_datas_on_company_name_length_max"
    t.index ["company_name_length_min"], name: "index_company_length_datas_on_company_name_length_min"
    t.index ["sales_count"], name: "index_company_length_datas_on_sales_count"
    t.index ["template_id"], name: "index_company_length_datas_on_template_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_industries_on_name"
  end

  create_table "template_stats", force: :cascade do |t|
    t.integer "template_id"
    t.integer "industry_id"
    t.integer "impressions_count"
    t.integer "clicks_count"
    t.integer "sales_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clicks_count"], name: "index_template_stats_on_clicks_count"
    t.index ["impressions_count"], name: "index_template_stats_on_impressions_count"
    t.index ["industry_id"], name: "index_template_stats_on_industry_id"
    t.index ["sales_count"], name: "index_template_stats_on_sales_count"
    t.index ["template_id"], name: "index_template_stats_on_template_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "preview_image"
    t.boolean "icon_required", default: false, null: false
    t.boolean "slogan_required", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["icon_required"], name: "index_templates_on_icon_required"
    t.index ["preview_image"], name: "index_templates_on_preview_image"
    t.index ["slogan_required"], name: "index_templates_on_slogan_required"
  end

end
