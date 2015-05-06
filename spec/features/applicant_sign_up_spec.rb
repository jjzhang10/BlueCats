require 'spec_helper'
require 'rails_helper'

feature "Applicant sign up" do
	scenario 'with invalid information' do
		sign_up_with(nil, 'tom@tom.com', '123456')
		expect(page).to have_content("Name can't be blank")
	end

	scenario 'with valid information' do
		sign_up_with('Tom', 'tom@tom.com', '123456')
		expect(page).to have_content('Please check your email to activate your account')
	end
end
