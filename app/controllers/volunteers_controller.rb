class VolunteersController < ApplicationController

	def show
		
	end
	
	def new
		@applicant=current_user
		@volunteer=@applicant.volunteers.new
		render '_volunteer_application'
	end
	
	def create
		@applicant=current_user
		case params[:step].to_i
			when 1
				@volunteer=Volunteer.new(params[:volunteer])
				if @volunteer.save

					render '_general_information'
				else
					flash.now[:danger]="failed"
					render 'new'
				end
			when 2..4
			
			when 5
			
			else
			
		end
	end
	
end
