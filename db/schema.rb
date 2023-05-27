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

ActiveRecord::Schema[7.0].define(version: 2023_05_27_192245) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "effects", force: :cascade do |t|
    t.string "property"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "material_effects", force: :cascade do |t|
    t.bigint "material_id", null: false
    t.bigint "effect_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["effect_id"], name: "index_material_effects_on_effect_id"
    t.index ["material_id"], name: "index_material_effects_on_material_id"
  end

  create_table "material_locations", force: :cascade do |t|
    t.bigint "material_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_material_locations_on_location_id"
    t.index ["material_id"], name: "index_material_locations_on_material_id"
  end

  create_table "material_recipes", force: :cascade do |t|
    t.bigint "material_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_material_recipes_on_material_id"
    t.index ["recipe_id"], name: "index_material_recipes_on_recipe_id"
  end

  create_table "materials", force: :cascade do |t|
    t.integer "compendium_id"
    t.string "name"
    t.string "description"
    t.string "image_url"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "material_effects", "effects"
  add_foreign_key "material_effects", "materials"
  add_foreign_key "material_locations", "locations"
  add_foreign_key "material_locations", "materials"
  add_foreign_key "material_recipes", "materials"
  add_foreign_key "material_recipes", "recipes"
end
