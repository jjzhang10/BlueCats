class ApplicantMailer < ActionMailer::Base
  default from: "noreply@scottyshouse-apply.herokuapp.com"
	#layout 'mailer'

  def account_activation(applicant)
    @applicant=applicant
    mail to: applicant.email, subject: "Account Activation"
  end


  def password_reset(applicant)
    @applicant=applicant
    mail to: applicant.email, subject: "Password Reset"
  end
  
  def internship_notification(applicant,internship)
  	@applicant=applicant
  	@internship=internship
  	mail to: "shenminzhou@gmail.com", subject: "New counseling intern application"
  end
  
  def volunteer_notification(applicant,volunteer)
  	@applicant=applicant
  	@volunteer=volunteer
  	mail to: "shenmin@tamu.edu", subject: "New volunteer/program intern application"
  end
  
  def internship_confirmation(applicant,internship)
  	@applicant=applicant
  	@internship=internship
  	mail to: applicant.email, subject: "Counseling intern application confirmation"
  end
  
  def volunteer_confirmation(applicant,volunteer)
  	@applicant=applicant
  	@volunteer=volunteer
  	mail to: applicant.email, subject: "Volunteer/program intern application confirmation"
  end
  
end
