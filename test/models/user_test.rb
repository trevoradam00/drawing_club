require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(name: "Hot Dog", email: "hot@dog.com")
	end
	
	test 'user should be valid' do
		assert @user.valid?
	end
	
	test 'user name should exist' do
		@user.name = " "
		assert_not @user.valid?
	end
	
	test 'user name is too short' do 
		@user.name = "aa"
		assert_not @user.valid?
	end
	
	test 'user name is too long' do
		@user.name = "a" * 31
		assert_not @user.valid?
	end
	
	test 'email validation should accept valid addresses' do
		valid_addresses = %w[user@eee.org R_TDD-DS@eee.aaa.org]
		valid_addresses.each do |va|
			@user.email = va
			assert @user.valid?, '#{va.inspect} should be valid'
		end
	end

end