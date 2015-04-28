class AddStatus < ActiveRecord::Migration
  def change
  	add_column :volunteers, :submited, :boolean, default: false
  	add_column :volunteers, :viewed, :boolean, default: false
  	add_column :internships, :submited, :boolean, default: false
  	add_column :internships, :viewed, :boolean, default: false
  end
end
