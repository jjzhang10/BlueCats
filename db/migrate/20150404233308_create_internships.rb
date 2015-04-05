class CreateInternships < ActiveRecord::Migration
  def change
    create_table :internships do |t|
      t.references :applicant
      
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.boolean :counseling_student
      t.string :university_a
      t.string :supervisor
      t.string :sup_phone
      t.string :sup_email
      t.string :graduation_date
      t.boolean :commit_two_semester
      t.boolean :LPC_intern
      t.string :univeristy_b
      t.string :LPC_supervisor
      t.string :LPC_supervisor_phone
      t.string :LPC_supervisor_email
      t.boolean :commit_one_year
      t.text :course_requirement
      t.text :experience_with_children
      
      t.text :how_hear
      t.text :victim
      t.text :why_work
      t.text :hope_to_do
      t.string :other_language
      t.text :other_information
      
      t.string :reference_name_prof
      t.string :reference_phone_prof
      t.string :relationship_prof
      t.string :how_long_prof
      t.string :reference_name_personal
      t.string :reference_phone_personal
      t.string :relationship_personal
      t.string :how_long_personal
      
      t.string :emergency_name
      t.string :emergency_relationship
      t.string :emergency_phone
      t.string :emergency_address
      t.string :emergency_city
      t.string :emergency_state
      t.string :emergency_zip

      t.timestamps
    end
    add_index :internships, :applicant_id
  end
end
