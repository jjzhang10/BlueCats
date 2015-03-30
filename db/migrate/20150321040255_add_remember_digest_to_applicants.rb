class AddRememberDigestToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :remember_digest, :string
  end
end
