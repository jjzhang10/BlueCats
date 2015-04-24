class ChangeDaysAvailableFormatInVolunteer < ActiveRecord::Migration
  def up
  	change_column :volunteers, :days_available, :string
  end

  def down
  	change_column :volunteers, :days_available, :integer
  end
end
