class AddActivationToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :activation_digest, :string
    add_column :applicants, :activated, :boolean, default: false
    add_column :applicants, :activated_at, :datetime
  end
end
