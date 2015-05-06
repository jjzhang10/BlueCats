require 'spec_helper'
require 'rails_helper'

feature 'Applicant login' do 
	scenario 'with invalid information' do
		visit login_path
		fill_in 'Email', with: "invalid email"
		fill_in 'Password', with: "invalid password"
		click_button 'Log in'
		expect(page).to have_content('Invalid email or password.')
	end

	scenario 'with valid information' do
		me=Applicant.create(name: 'shenminzhou', email: 'shenminzhou@gmail.com', password: '123456', password_confirmation: '123456')
		me.update_attributes(activated: true);
		visit login_path
		fill_in 'Email', with: "shenminzhou@gmail.com"
		fill_in 'Password', with: "123456"
		click_button 'Log in'
		expect(page).to have_content('My applications')
		me.update_attributes(admin: true);
		visit login_path
		fill_in 'Email', with: "shenminzhou@gmail.com"
		fill_in 'Password', with: "123456"
		click_button 'Log in'
		expect(page).to have_content('Administrator Interface')
	end
end 