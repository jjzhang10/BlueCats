class AddAdminToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :admin, :boolean, default: false
  end
end
