class VolunteersController < ApplicationController

	before_filter :logged_in_user

	def show
		@applicant=Applicant.where(id: params[:applicant_id]).first
		@volunteer=@applicant.volunteers.where(id: params[:id]).first		
	end
	
	def new
		@applicant=current_user
		@volunteer=@applicant.volunteers.new
	end
	
	def create
		@applicant=current_user
		@volunteer=@applicant.volunteers.new(params[:volunteer])
		if @volunteer.save
			render '_general_information'
		else
			flash.now[:danger]="failed"
			render 'new'
		end		
	end
	
	def edit
		@applicant=Applicant.where(id: params[:applicant_id]).first
		@volunteer=@applicant.volunteers.where(id: params[:id]).first
		render '_volunteer_application'
	end
	
	def update
		@applicant=current_user
		step=params[:step].to_i
		@volunteer=@applicant.volunteers.where(id: params[:volunteer_id]).first
				if @volunteer.update_attributes(params[:volunteer])
					case step
					when 1
						render '_general_information'
					when 2
						render '_experience'
					when 3
						render '_skills_special_ability'
					when 4
						render '_emergency_notification'
					when 5
						flash[:success]="Application submitted/updated."
						redirect_to @applicant
					end
				else
				end
		
	end
	
	def destroy
		Volunteer.find(params[:id]).destroy
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






