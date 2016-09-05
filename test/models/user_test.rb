require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
	def setup
		@user = User.new(name: "Example", email: "valid@valid.com", password: "abc", password_confirmation: "abc", target_weight: "195", current_weight: "195", 
			current_bodyfat: "14", carb_percent: "30", protein_percent: "50", fat_percent: "20")		
	end

	test "initial user object should be valid" do
		assert @user.valid?
	end

	test "name should be present" do
		@user.name = ""
		assert_not @user.valid?
	end

	test "name should not be too long" do
		@user.name = "a" * 51
		assert_not @user.valid?
	end


	test "email should be present" do
		@user.email = ""
		assert_not @user.valid?
	end

	test "email should not be too long" do
		@user.email = "a" * 246 + "@valid.com"
		assert_not @user.valid?
	end

	test "valid email addresses should be valid" do
		valid_addresses = %w[aa@gmail.com AA@gmail.com aa@GMAIL.COM a-a@king.cn sw+ag@co.uk breh@doj.fek.org yo.gotti@atme.co.jp]

		valid_addresses.each do |valid_address|
			@user.email = valid_address
			assert @user.valid?, "#{valid_address.inspect} should be valid"
		end
	end

	test "invalid email addresses should be invalid" do
		invalid_addresses = %w[aagmail.com AA@gmail,com aa@GMAIL@COM a-a@king+cn, sw+ag@co+uk.com, breh_at_doj.fek.org]

		invalid_addresses.each do |invalid_address|
			@user.email = invalid_address
			assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
		end
	end	

	# test "improperly formatted email addresses are invalid" do
		#@user.email = 

end
