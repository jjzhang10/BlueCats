class ApplicantsController < ApplicationController

	before_filter :logged_in_user, only: [:show, :edit, :update, :index, :destroy]
	before_filter :correct_user, only: [:edit, :update]
	before_filter :admin_user, only: [:index, :destroy]
	before_filter :correct_or_admin, only: [:show]

  def new
		@applicant=Applicant.new
  end

	def show
		@applicant=Applicant.find(params[:id])
		@volunteers=@applicant.volunteers.all
		@internships=@applicant.internships.all
		redirect_to root_url and return unless @applicant.activated?
	end

	def create
		@applicant=Applicant.new(applicant_params)
		if @applicant.save
			#log_in @applicant
			#flash[:success]="Account created successfully!"
			#redirect_to @applicant
			@applicant.send_activation_email
			flash[:info]="Please check your email to activate your account"
			redirect_to root_url
		else
			render 'new'
		end
	end
	
	def edit
		@applicant=Applicant.find(params[:id])
	end
	
	def update
		@applicant=Applicant.where(id: params[:id]).first
		if @applicant.update_attributes(applicant_params)
			flash[:success]="Information updated successfully!"
			redirect_to @applicant
		else
			render 'edit'
		end
	end
	
	def destroy
		Applicant.find(params[:id]).destroy
		flash[:success]="Successfully deleted."
		redirect_to applicants_url
	end
	
	def index
		@applicants=Applicant.where(activated: true).paginate(page: params[:page], per_page: 15)
	end

	private
		def applicant_params
			params.require(:applicant).permit(:name, :email, :password, :password_confirmation)
		end
		
	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger]="You need to log in."
			redirect_to login_url
		end
	end
	
	def correct_user
		@applicant=Applicant.where(id: params[:id]).first
		unless current_user?(@applicant)
			flash[:danger]="Authorization limited."
			redirect_to(root_url)			
		end
	end
	
	def admin_user
		unless current_user.is_admin?
			flash[:danger]="Authorization limited."
			redirect_to(root_url)			
		end
	end
	
	def correct_or_admin
		@applicant=Applicant.where(id: params[:id]).first
		unless ( current_user?(@applicant) || current_user.is_admin? )
			flash[:danger]="Authorization limited."
			redirect_to(root_url)			
		end
	end
end










