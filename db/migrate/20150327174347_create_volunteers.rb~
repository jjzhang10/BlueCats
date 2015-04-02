class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.references :applicant
      
      t.string :name
      t.string :date_of_birth
      t.string :email
      t.string :phone
      t.string :mailing_address
      t.boolean :family_care
      t.boolean :medical_volunteer
      t.boolean :ambassador
      t.boolean :pragram_internship
      t.boolean :prevention_volunteer
      t.boolean :additional_volunteer_opportunity
      t.string :additional_volunteer_opportunity_spec
      t.integer :days_available
      
      t.text :how_learn_about
      t.text :what_to_gain
      t.boolean :class_credit
      t.string :instructor_name
      t.boolean :organization_credit
      t.string :organiztion_name
      t.boolean :other
      t.string :other_spec
      t.boolean :employed
      t.string :employer_name
      
      t.text :experience
      t.boolean :child_abuse
      t.text :child_abuse_spec
      t.boolean :foster_care
      t.text :foster_care_spec
      t.boolean :criminal
      t.text :crinimal_spec
      t.boolean :other_service
      t.text :other_service_spec
      
      t.boolean :speak
      t.string :speak_what
      t.boolean :read
      t.string :read_what
      t.boolean :blind
      t.string :blind_experience
      t.boolean :handicap
      t.string :handicap_experience
      
      t.string :emergency_name
      t.string :emergency_phone
      t.string :emergency_address
      t.string :emergency_relation

      t.timestamps
    end
    add_index :volunteers, :applicant_id
  end
end
