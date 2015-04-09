class Internship < ActiveRecord::Base
  belongs_to :applicant
  # attr_accessible :title, :body
  attr_protected
  
  validates :name, presence: true
end
