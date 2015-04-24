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

ActiveRecord::Schema.define(:version => 20150424012017) do

  create_table "applicants", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             :default => false
    t.string   "activation_digest"
    t.boolean  "activated",         :default => false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "applicants", ["email"], :name => "index_applicants_on_email", :unique => true

  create_table "internships", :force => true do |t|
    t.integer  "applicant_id"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.boolean  "counseling_student"
    t.string   "university_a"
    t.string   "supervisor"
    t.string   "sup_phone"
    t.string   "sup_email"
    t.string   "graduation_date"
    t.boolean  "commit_two_semester"
    t.boolean  "LPC_intern"
    t.string   "univeristy_b"
    t.string   "LPC_supervisor"
    t.string   "LPC_supervisor_phone"
    t.string   "LPC_supervisor_email"
    t.boolean  "commit_one_year"
    t.text     "course_requirement"
    t.text     "experience_with_children"
    t.text     "how_hear"
    t.text     "victim"
    t.text     "why_work"
    t.text     "hope_to_do"
    t.string   "other_language"
    t.text     "other_information"
    t.string   "reference_name_prof"
    t.string   "reference_phone_prof"
    t.string   "relationship_prof"
    t.string   "how_long_prof"
    t.string   "reference_name_personal"
    t.string   "reference_phone_personal"
    t.string   "relationship_personal"
    t.string   "how_long_personal"
    t.string   "emergency_name"
    t.string   "emergency_relationship"
    t.string   "emergency_phone"
    t.string   "emergency_address"
    t.string   "emergency_city"
    t.string   "emergency_state"
    t.string   "emergency_zip"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "internships", ["applicant_id"], :name => "index_internships_on_applicant_id"

  create_table "volunteers", :force => true do |t|
    t.integer  "applicant_id"
    t.string   "name"
    t.string   "date_of_birth"
    t.string   "email"
    t.string   "phone"
    t.string   "mailing_address"
    t.boolean  "family_care"
    t.boolean  "medical_volunteer"
    t.boolean  "ambassador"
    t.boolean  "pragram_internship"
    t.boolean  "prevention_volunteer"
    t.boolean  "additional_volunteer_opportunity"
    t.string   "additional_volunteer_opportunity_spec"
    t.string   "days_available"
    t.text     "how_learn_about"
    t.text     "what_to_gain"
    t.boolean  "class_credit"
    t.string   "instructor_name"
    t.boolean  "organization_credit"
    t.string   "organiztion_name"
    t.boolean  "other"
    t.string   "other_spec"
    t.boolean  "employed"
    t.string   "employer_name"
    t.text     "experience"
    t.boolean  "child_abuse"
    t.text     "child_abuse_spec"
    t.boolean  "foster_care"
    t.text     "foster_care_spec"
    t.boolean  "criminal"
    t.text     "crinimal_spec"
    t.boolean  "other_service"
    t.text     "other_service_spec"
    t.boolean  "speak"
    t.string   "speak_what"
    t.boolean  "read"
    t.string   "read_what"
    t.boolean  "blind"
    t.string   "blind_experience"
    t.boolean  "handicap"
    t.string   "handicap_experience"
    t.string   "emergency_name"
    t.string   "emergency_phone"
    t.string   "emergency_address"
    t.string   "emergency_relation"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "volunteers", ["applicant_id"], :name => "index_volunteers_on_applicant_id"

end
