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

ActiveRecord::Schema.define(version: 2019_10_14_141944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "addresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "address1", null: false
    t.string "address2"
    t.string "address3"
    t.string "address4"
    t.string "address5"
    t.string "postcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "addressable_id"
    t.string "addressable_type"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "allocation_decisions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "originatingHearingId"
    t.uuid "offenceId"
    t.uuid "motReasonId"
    t.string "motReasonDescription"
    t.integer "motReasonCode"
    t.datetime "allocationDecisionDate"
    t.boolean "isSection22ALowValueShoplifting", default: false, null: false
    t.boolean "isDamageValueUnder5000", default: false, null: false
    t.boolean "isTreatedAsIndictableOnly", default: false, null: false
    t.boolean "sentencingIndicationRequested", default: false, null: false
    t.uuid "court_indicated_sentence_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["court_indicated_sentence_id"], name: "index_allocation_decisions_on_court_indicated_sentence_id"
  end

  create_table "contact_numbers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "home"
    t.string "work"
    t.string "mobile"
    t.string "primaryEmail"
    t.string "secondaryEmail"
    t.string "fax"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "contactable_id"
    t.string "contactable_type"
    t.index ["contactable_type", "contactable_id"], name: "index_contact_numbers_on_contactable_type_and_contactable_id"
  end

  create_table "court_indicated_sentences", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "courtIndicatedSentenceTypeId"
    t.string "courtIndicatedSentenceDescription"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "delegated_powers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "userId"
    t.string "firstName"
    t.string "lastName"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ethnicities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "observedEthnicityId"
    t.string "observedEthnicityCode"
    t.string "observedEthnicityDescription"
    t.uuid "selfDefinedEthnicityId"
    t.string "selfDefinedEthnicityCode"
    t.string "selfDefinedEthnicityDescription"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "indicated_pleas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "offenceId"
    t.uuid "originatingHearingId"
    t.datetime "indicatedPleaDate"
    t.string "indicatedPleaValue"
    t.string "source"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notified_pleas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "offenceId"
    t.datetime "notifiedPleaDate"
    t.string "notifiedPleaValue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "firstName"
    t.string "middleName"
    t.string "lastName"
    t.datetime "dateOfBirth"
    t.uuid "nationalityId"
    t.string "nationalityCode"
    t.string "nationalityDescription"
    t.uuid "additionalNationalityId"
    t.string "additionalNationalityCode"
    t.string "additionalNationalityDescription"
    t.string "disabilityStatus"
    t.uuid "ethnicity_id"
    t.string "gender"
    t.string "interpreterLanguageNeeds"
    t.string "documentationLanguageNeeds"
    t.string "nationalInsuranceNumber"
    t.string "occupation"
    t.string "occupationCode"
    t.string "specificRequirements"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ethnicity_id"], name: "index_people_on_ethnicity_id"
  end

  create_table "pleas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "originatingHearingId"
    t.uuid "offenceId"
    t.datetime "pleaDate"
    t.string "pleaValue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "delegated_powers_id"
    t.index ["delegated_powers_id"], name: "index_pleas_on_delegated_powers_id"
  end

  create_table "police_officer_in_cases", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "person_id", null: false
    t.string "policeOfficerRank"
    t.string "policeWorkerReferenceNumber"
    t.string "policeWorkerLocationCode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_police_officer_in_cases_on_person_id"
  end

  create_table "prosecution_case_identifiers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "caseURN"
    t.string "prosecutionAuthorityReference"
    t.uuid "prosecutionAuthorityId", null: false
    t.string "prosecutionAuthorityCode", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "allocation_decisions", "court_indicated_sentences"
  add_foreign_key "people", "ethnicities"
  add_foreign_key "pleas", "delegated_powers", column: "delegated_powers_id"
  add_foreign_key "police_officer_in_cases", "people"
end
