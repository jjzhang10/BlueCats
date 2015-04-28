class InternshipsController < ApplicationController

	before_filter :logged_in_user
	before_filter :correct_user, only: [:edit, :update, :destroy]
	before_filter :correct_or_admin, only: [:show]
	
	require 'will_paginate/array'
	
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
						flash[:success]=["Application created/updated.","You can view/edit/delete your application before submission."]
						redirect_to @applicant
					end
				else
					case step
					when 1
						render '_general_information'
					when 2
						render '_additional_information'
					when 3
						render '_letter_of_recommendation'
					when 4
						render '_emergency_notification'
					end
				end
		
	end
	
	def destroy
		Internship.find(params[:id]).destroy
		flash[:success]="Successfully deleted."
		redirect_to current_user
	end
	
	def index
		@internships=Internship.all.paginate(page: params[:page], per_page: 15)
	end
	
	def change_status
		@applicant=current_user
		@internship=@applicant.internships.where(id: params[:id]).first
		ApplicantMailer.internship_notification(@applicant,@internship).deliver
		@internship.update_attributes(params[:status])
		flash[:success]=["Application form submited!","To finish your application, please also complete:", "Intern Agreement.pdf", "Pledge of Confidentiality.pdf", "Non-disclosure Form.pdf", "Background Check.pdf", "which can be found in Resouces tab above and send them to info@scottyshouse.org"]
		redirect_to current_user
	end
	
	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger]="You need to log in."
			redirect_to login_url
		end
	end

	def correct_user
		@internship=Internship.where(id: params[:id]).first
		unless current_user?(@internship.applicant)
			flash[:danger]="Authorization limited."
			redirect_to(root_url)			
		end
	end
	
	def correct_or_admin
		@internship=Internship.where(id: params[:id]).first
		unless ( current_user?(@internship.applicant) || current_user.is_admin? )
			flash[:danger]="Authorization limited."
			redirect_to(root_url)			
		end
	end




end
