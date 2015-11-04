require_relative '../passwordchecker.rb'

RSpec.describe "PasswordChecker" do 
	describe "#check_password" do

	before :each do 
	@pass = PasswordChecker.new
	end

	it "expect false from a nil string" do
	expect(@pass.check_password(nil, nil)).to be false
	end

	it "expect false from a string smaller than seven" do
	expect(@pass.check_password(nil, "perro")).to be false
	end

	it "expect false from a string largest than seven that doesn not commit to the other rules" do
	expect(@pass.check_password(nil, "botellita")).to be false
	end

	it "expect false from an incomplete password" do
	expect(@pass.check_password(nil, "pepepepe")).to be false
	end

	it "expect false from an incomplete password" do
	expect(@pass.check_password(nil, "pepe&%pepe")).to be false
	end

	it "expect true from a complete password" do
	expect(@pass.check_password("juan@yahoo.es", "Pepe&%pe56pe")).to be true
	end

	it "expect false from a password with the username included" do
	expect(@pass.check_password("pepe@gmail.com", "pepe&%pe56Pe")).to be false
	end



	end



end



