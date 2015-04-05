class InternshipsController < ApplicationController

	before_filter :logged_in_user

	def show
		@applicant=Applicant.where(id: params[:applicant_id]).first
		@internship=@applicant.internships.where(id: params[:id]).first		
	end
	
	def new
		@applicant=current_user
		@internship=@applicant.internships.new
	end
	
	def create
		@applicant=current_user
		@internship=@applicant.internships.new(params[:internship])
		if @internship.save
			render '_additional_information'
		else
			flash.now[:danger]="failed"
			render 'new'
		end		
	end
	
	def edit
		@applicant=Applicant.where(id: params[:applicant_id]).first
		@internship=@applicant.internships.where(id: params[:id]).first
		render '_general_information'
	end
	
	def update
		@applicant=current_user
		step=params[:step].to_i
		@internship=@applicant.internships.where(id: params[:id]).first
				if @internship.update_attributes(params[:internship])
					case step
					when 1
						render '_additional_information'
					when 2
						render '_letter_of_recommendation'
					when 3
						render '_emergency_notification'
					when 4
						flash[:success]="Application submitted/updated."
						redirect_to @applicant
					end
				else
				end
		
	end
	
	def destroy
		internship.find(params[:id]).destroy
		flash[:success]="Successfully deleted."
		redirect_to current_user
	end
	
	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger]="You need to log in."
			redirect_to login_url
		end
	end






end
