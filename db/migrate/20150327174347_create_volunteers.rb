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

      t.timestamps
    end
    add_index :volunteers, :applicant_id
  end
end
