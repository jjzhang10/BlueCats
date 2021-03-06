module SessionsHelper
	def log_in(applicant)
		session[:applicant_id]=applicant.id
	end	

	def current_user
		if (applicant_id = session[:applicant_id])
      @current_user ||= Applicant.where(id: applicant_id).first
    elsif (applicant_id = cookies.signed[:applicant_id])
      applicant = Applicant.where(id: applicant_id).first
      if applicant && applicant.authenticated?(:remember, cookies[:remember_token])
        log_in applicant
        @current_user = applicant
      end
    end
    @current_user
	end
	
	def current_user?(user)
		current_user==user
	end

	def logged_in?
		!current_user.nil?
	end
	
	def log_out
		forget(current_user)
		session.delete(:applicant_id)
		@current_user=nil
	end
	
	def remember(user)
		user.remember
		cookies.permanent.signed[:applicant_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
	end
	
	def forget(user)
		user.forget
		cookies.delete(:applicant_id)
		cookies.delete(:remember_token)
	end
	
	def store_location
    session[:forwarding_url] = request.url if request.get?
  end
  
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
end
