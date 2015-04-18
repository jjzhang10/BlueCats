class VolunteersController < ApplicationController

	before_filter :logged_in_user
	before_filter :correct_user, only: [:edit, :update, :destroy]
	before_filter :correct_or_admin, only: [:show]

	require 'will_paginate/array'
	
	def show
		@applicant=Applicant.where(id: params[:applicant_id]).first
		@volunteer=@applicant.volunteers.where(id: params[:id]).first		
	end
	
	def new
		@applicant=current_user
		@volunteer=@applicant.volunteers.new
		@type=params[:type]
	end
	
	def create
		@applicant=current_user
		@volunteer=@applicant.volunteers.new(params[:volunteer])
		@type=params[:type]
		if @volunteer.save
			render '_general_information'
		else
			render 'new'
		end		
	end
	
	def edit
		@applicant=Applicant.where(id: params[:applicant_id]).first
		@volunteer=@applicant.volunteers.where(id: params[:id]).first
		render 'new'
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
					case step
					when 1
						render 'new'
					when 2
						render '_general_information'
					when 3
						render '_experience'
					when 4
						render '_skills_special_ability'
					when 5
						render '_emergency_notification'
					end
				end
		
	end
	
	def destroy
		Volunteer.find(params[:id]).destroy
		flash[:success]="Successfully deleted."
		redirect_to current_user
	end
	
	def index
		@type=params[:type]
		@volunteers=Volunteer.all.paginate(page: params[:page], per_page: 15)
	end
	
	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger]="You need to log in."
			redirect_to login_url
		end
	end
	
	def correct_user
		@volunteer=Volunteer.where(id: params[:id]).first
		unless current_user?(@volunteer.applicant)
			flash[:danger]="Authorization limited."
			redirect_to(root_url)			
		end
	end
	
	def correct_or_admin
		@volunteer=Volunteer.where(id: params[:id]).first
		unless ( current_user?(@volunteer.applicant) || current_user.is_admin? )
			flash[:danger]="Authorization limited."
			redirect_to(root_url)			
		end
	end
	
end






