require 'spec_helper'
require 'rails_helper'
 
describe ApplicantsController do
	it "should get new" do
		get :new
		response.should be_success
	end
	
	describe 'Search function' do
		before :each do
			@fake_results=[double('applicant1'),double('applicant2')]
		end

		it "should call the model method that performs applicant search" do
			results=Applicant.where(name: 'test')
			Applicant.should_receive(:search).with('test').and_return(results)
			get :search, {search: 'test'}
		end

		it "should select the Search Results template for rendering" do			
			Applicant.stub(:search).and_return(@fake_results)
			get :search, {search: 'test'}
			response.should render_template('search')
		end

		it "should make applicants search results available to that template" do
			Applicant.stub(:search).and_return(@fake_results)
			get :search, {search: 'test'}
			assigns(:applicants).should eq @fake_results
		end
	end
end
