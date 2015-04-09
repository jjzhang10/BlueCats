class Volunteer < ActiveRecord::Base
  belongs_to :applicant
  #attr_accessible :title, :body
  attr_protected
  
  VALID_DOB_REGEX=/^\d{2}\/\d{2}\/\d{4}$/i
  validates :date_of_birth, format: {with: VALID_DOB_REGEX}
  VALID_EMAIL_REGEX= /\A[\w\.\-]+\@[a-z\d\.\-]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255}, 
						format: {with: VALID_EMAIL_REGEX}
end
