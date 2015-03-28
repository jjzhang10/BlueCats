class AddResetToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :reset_digest, :string
    add_column :applicants, :reset_sent_at, :datetime
  end
end
