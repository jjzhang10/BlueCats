require 'spec_helper'
require 'rails_helper'

feature 'Applicant logout' do 
	scenario 'with the logout button' do
		me=Applicant.create(name: 'shenminzhou', email: 'shenminzhou@gmail.com', password: '123456', password_confirmation: '123456')
		me.update_attributes(activated: true);
		visit login_path
		fill_in 'Email', with: "shenminzhou@gmail.com"
		fill_in 'Password', with: "123456"
		click_button 'Log in'
		click_link 'Log out'
		expect(page).to have_content("Welcome to Scotty's House")
	end
end 