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

ActiveRecord::Schema.define(version: 20171108104417) do

  create_table "annotation_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.boolean "generated_by_system", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "annotations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "annotation_category_id"
    t.string "entry_type"
    t.integer "entry_id"
    t.text "detail"
    t.index ["annotation_category_id"], name: "index_annotations_on_annotation_category_id"
    t.index ["entry_type", "entry_id"], name: "index_annotations_on_entry_type_and_entry_id"
  end

  create_table "categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "area", default: "dresden"
    t.index ["area"], name: "index_categories_on_area"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "chapters", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", null: false
    t.text "content"
    t.integer "order"
    t.string "area"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_chapters_on_category_id"
  end

  create_table "contact_infos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "contactable_type"
    t.integer "contactable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mail"
    t.string "phone"
    t.string "contact_person"
    t.string "internal_id"
    t.string "web", limit: 1000
    t.string "social_media", limit: 1000
    t.string "spoken_languages"
    t.boolean "migrated_from_neos", default: false
    t.text "opening_hours"
    t.string "fax"
    t.index ["contactable_type", "contactable_id"], name: "index_contact_infos_on_contactable_type_and_contactable_id"
  end

  create_table "entries", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "entry_type"
    t.integer "entry_id"
    t.index ["entry_type", "entry_id"], name: "index_entries_on_entry_type_and_entry_id"
  end

  create_table "events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "description"
    t.text "short_description"
    t.string "public_speaker"
    t.string "location_type"
    t.boolean "support_wanted"
    t.string "support_wanted_detail", limit: 1000
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_event_id"
    t.integer "orga_id"
    t.datetime "date_start"
    t.string "state"
    t.datetime "state_changed_at"
    t.integer "category_id"
    t.integer "sub_category_id"
    t.datetime "date_end"
    t.boolean "time_start", default: false
    t.boolean "time_end", default: false
    t.string "media_url", limit: 1000
    t.string "media_type"
    t.boolean "for_children"
    t.boolean "certified_sfr"
    t.string "legacy_entry_id"
    t.boolean "migrated_from_neos", default: false
    t.string "tags"
    t.string "inheritance"
    t.string "area"
    t.index ["area"], name: "index_events_on_area"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["orga_id"], name: "index_events_on_orga_id"
    t.index ["sub_category_id"], name: "index_events_on_sub_category_id"
  end

  create_table "locations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "lat"
    t.string "lon"
    t.string "street"
    t.string "placename"
    t.string "zip"
    t.string "city"
    t.string "district"
    t.string "state"
    t.string "country"
    t.boolean "displayed"
    t.string "locatable_type"
    t.integer "locatable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "internal_id"
    t.boolean "migrated_from_neos", default: false
    t.text "directions"
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id"
  end

  create_table "orga_category_relations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id"
    t.integer "orga_id"
    t.boolean "primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_orga_category_relations_on_category_id"
    t.index ["orga_id"], name: "index_orga_category_relations_on_orga_id"
  end

  create_table "orgas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.text "short_description"
    t.integer "parent_orga_id"
    t.string "state"
    t.datetime "state_changed_at"
    t.integer "category_id"
    t.integer "sub_category_id"
    t.string "media_url", limit: 1000
    t.string "media_type"
    t.boolean "support_wanted"
    t.string "support_wanted_detail", limit: 1000
    t.boolean "for_children"
    t.boolean "certified_sfr"
    t.string "legacy_entry_id"
    t.boolean "migrated_from_neos", default: false
    t.string "tags"
    t.string "inheritance"
    t.string "area"
    t.index ["area"], name: "index_orgas_on_area"
    t.index ["category_id"], name: "index_orgas_on_category_id"
    t.index ["sub_category_id"], name: "index_orgas_on_sub_category_id"
  end

  create_table "owner_thing_relations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ownable_type"
    t.integer "ownable_id"
    t.string "thingable_type"
    t.integer "thingable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ownable_type", "ownable_id"], name: "index_owner_thing_relations_on_ownable_type_and_ownable_id"
    t.index ["thingable_type", "thingable_id"], name: "index_owner_thing_relations_on_thingable_type_and_thingable_id"
  end

  create_table "resource_items", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", null: false
    t.string "description"
    t.string "tags"
    t.integer "orga_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["orga_id"], name: "index_resource_items_on_orga_id"
  end

  create_table "roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.integer "user_id"
    t.integer "orga_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orga_id"], name: "index_roles_on_orga_id"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "thing_category_relations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "category_id"
    t.string "catable_type"
    t.integer "catable_id"
    t.boolean "primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catable_type", "catable_id"], name: "index_thing_category_relations_on_catable_type_and_catable_id"
    t.index ["category_id"], name: "index_thing_category_relations_on_category_id"
  end

  create_table "translation_caches", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "cacheable_id"
    t.string "cacheable_type", limit: 20
    t.string "language", limit: 3, null: false
    t.string "title"
    t.text "short_description"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cacheable_id", "cacheable_type", "language"], name: "index_translation_cache"
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "forename"
    t.string "surname"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.text "tokens"
    t.string "area"
    t.index ["area"], name: "index_users_on_area"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
