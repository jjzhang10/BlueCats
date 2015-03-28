class ApplicantMailer < ActionMailer::Base
  default from: "noreply@apply-scottyshouse.herokuapp.com"
	#layout 'mailer'

  def account_activation(applicant)
    @applicant=applicant
    mail to: applicant.email, subject: "Account Activation"
  end


  def password_reset(applicant)
    @applicant=applicant
    mail to: applicant.email, subject: "Password Reset"
  end
end
