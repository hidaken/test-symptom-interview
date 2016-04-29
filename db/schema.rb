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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160419061952) do

  create_table "categorise_disease_relations", force: :cascade do |t|
    t.integer  "disease_id",    limit: 4
    t.integer  "categorise_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "categorise_disease_relations", ["categorise_id"], name: "index_categorise_disease_relations_on_categorise_id", using: :btree
  add_index "categorise_disease_relations", ["disease_id", "categorise_id"], name: "index_disease_categorise", unique: true, using: :btree
  add_index "categorise_disease_relations", ["disease_id"], name: "index_categorise_disease_relations_on_disease_id", using: :btree

  create_table "categorise_symptom_relations", force: :cascade do |t|
    t.integer  "categorise_id", limit: 4
    t.integer  "symptom_id",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "categorise_symptom_relations", ["categorise_id"], name: "index_categorise_symptom_relations_on_categorise_id", using: :btree
  add_index "categorise_symptom_relations", ["symptom_id"], name: "index_categorise_symptom_relations_on_symptom_id", using: :btree

  create_table "categorises", force: :cascade do |t|
    t.string   "categorise_name", limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "classify_relations", force: :cascade do |t|
    t.integer  "disease_id",          limit: 4
    t.integer  "disease_classify_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "classify_relations", ["disease_classify_id"], name: "index_classify_relations_on_disease_classify_id", using: :btree
  add_index "classify_relations", ["disease_id", "disease_classify_id"], name: "index_classify_relations_on_disease_id_and_disease_classify_id", unique: true, using: :btree
  add_index "classify_relations", ["disease_id"], name: "index_classify_relations_on_disease_id", using: :btree

  create_table "disease_classifies", force: :cascade do |t|
    t.string   "classify_name", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "disease_relations", force: :cascade do |t|
    t.integer  "disease_from_id", limit: 4
    t.integer  "disease_to_id",   limit: 4
    t.integer  "relation_type",   limit: 4, null: false
    t.integer  "point",           limit: 4, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "disease_relations", ["disease_from_id"], name: "index_disease_relations_on_disease_from_id", using: :btree
  add_index "disease_relations", ["disease_to_id"], name: "index_disease_relations_on_disease_to_id", using: :btree

  create_table "disease_symptoms", force: :cascade do |t|
    t.integer  "disease_id",     limit: 4
    t.integer  "symptom_id",     limit: 4
    t.integer  "relation_point", limit: 4
    t.integer  "plr",            limit: 4
    t.integer  "nlr",            limit: 4
    t.text     "description",    limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "disease_symptoms", ["disease_id", "symptom_id"], name: "index_disease_symptoms_on_disease_id_and_symptom_id", unique: true, using: :btree
  add_index "disease_symptoms", ["disease_id"], name: "index_disease_symptoms_on_disease_id", using: :btree
  add_index "disease_symptoms", ["symptom_id"], name: "index_disease_symptoms_on_symptom_id", using: :btree

  create_table "diseases", force: :cascade do |t|
    t.string   "name",             limit: 255,                  null: false
    t.string   "onset",            limit: 255
    t.integer  "localization",     limit: 4
    t.integer  "importance",       limit: 4,     default: 0
    t.float    "morbidity_baby",   limit: 24,    default: 0.25, null: false
    t.float    "morbidity_child",  limit: 24,    default: 0.25, null: false
    t.float    "morbidity_adult",  limit: 24,    default: 0.25, null: false
    t.float    "morbidity_senior", limit: 24,    default: 0.25, null: false
    t.float    "morbidity_male",   limit: 24,    default: 0.5,  null: false
    t.float    "morbidity_female", limit: 24,    default: 0.5,  null: false
    t.float    "seasonality12to2", limit: 24,    default: 0.25, null: false
    t.float    "seasonality3to5",  limit: 24,    default: 0.25, null: false
    t.float    "seasonality6to8",  limit: 24,    default: 0.25, null: false
    t.float    "seasonality9to11", limit: 24,    default: 0.25, null: false
    t.string   "icd10_1",          limit: 255
    t.string   "icd10_2",          limit: 255
    t.text     "description",      limit: 65535
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "diseases", ["name"], name: "disease_index", unique: true, using: :btree

  create_table "frequency_points", force: :cascade do |t|
    t.integer  "disease_id",    limit: 4
    t.integer  "department_id", limit: 4
    t.integer  "point",         limit: 4, default: 1, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "login_id",        limit: 4
    t.string   "password_digest", limit: 255
    t.integer  "department_id",   limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "hospitals", ["login_id"], name: "index_hospitals_on_login_id", unique: true, using: :btree

  create_table "large_categorises", force: :cascade do |t|
    t.integer  "large_categorise_id",   limit: 4,   null: false
    t.string   "large_categorise_name", limit: 255
    t.integer  "categorise_id",         limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "onsets", force: :cascade do |t|
    t.string   "onset_name",   limit: 255, null: false
    t.string   "onset_detail", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "symptom_categories", force: :cascade do |t|
    t.string   "symptom_category_name", limit: 255, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "symptoms", force: :cascade do |t|
    t.integer  "symptom_category_id", limit: 4,     null: false
    t.string   "symptom_name",        limit: 255,   null: false
    t.integer  "symptom_flag",        limit: 4
    t.string   "symptom_text",        limit: 255
    t.text     "symptom_description", limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "symptoms", ["symptom_name"], name: "index_symptoms_on_symptom_name", using: :btree

end
