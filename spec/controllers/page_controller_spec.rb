require 'spec_helper'
require 'rails_helper'
 
describe PageController do
	describe 'Show home page' do
		it 'should show home page' do
			get :home
			response.should be_success
		end
	end
	it 'Should show contact information' do
		get :contact
		response.should be_success
	end
end
