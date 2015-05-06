require 'spec_helper'
require 'rails_helper'
 
describe Applicant do

	before(:each) do
		@someone=Applicant.create(name: "Some one", email: "someone@some.com", password: "123456", password_confirmation: "123456")
	end
	
	it 'is valid with a name, email and password' do
		expect(@someone).to be_valid
	end			
	
	it 'is invalid without a name' do
		@someone.name=nil
		@someone.valid?
		expect(@someone.errors[:name]).to include("can't be blank")
	end
	
	it 'is invalid without an email' do
		@someone.email=nil
		@someone.valid?
		expect(@someone.errors[:email]).to include("can't be blank")
	end
	
	it 'should have a valid email address' do
		@someone.email="asdas.asd"
		@someone.valid?
		expect(@someone.errors[:email]).to include("is invalid")
	end
	
	it 'should not have too long name' do
		@someone.name='a'*51
		@someone.valid?
		expect(@someone.errors[:name]).to include("is too long (maximum is 50 characters)")
	end
	
	it 'should not have too long email' do
		@someone.email="a" * 244 + "@example.com"
		@someone.valid?
		expect(@someone.errors[:email]).to include("is too long (maximum is 255 characters)")
	end

	it 'should be invaldi with duplicate email address' do
		someone=Applicant.create(name: "Some one", email: "someone@some.com", password: "123456")
		sometwo=Applicant.create(name: "Some two", email: "someone@some.com", password: "123456")
		sometwo.valid?
		expect(sometwo.errors[:email]).to include("has already been taken")
	end
	
	it 'should have a minimum password length' do
		@someone.password="a" * 5
		@someone.valid?
		expect(@someone.errors[:password]).to include("is too short (minimum is 6 characters)")
	end
	
	it 'should save email address in downcase' do
		mix="AAa@BBbb.CoM"
		@someone.email=mix
		@someone.save
		expect(@someone.reload.email).to eq mix.downcase
	end
end




