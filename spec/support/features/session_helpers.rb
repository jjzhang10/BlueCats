module Features
  module SessionHelpers
    def sign_up_with(name, email, password)
      visit signup_path
      fill_in 'Name', with: name
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password Confirmation', with: password
      click_button 'Create my account'
    end

    def sign_in
      user = Applicant.create(:applicant)
      visit signin_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end
  end
end