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

	test "email should be unique" do
		duplicate_user = @user.dup
		duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end

	test "valid current weights should be valid" do
		valid_weights = %w[20 510 220.4]

		valid_weights.each do |valid_weight|
			@user.current_weight = valid_weight
			assert @user.valid?, "#{valid_weight.inspect} should be valid"
		end
	end

	test "invalid current weights should be invalid" do
		invalid_weights = %w[-20 0 1000]

		invalid_weights.each do |invalid_weight|
			@user.current_weight = invalid_weight
			assert_not @user.valid?, "#{invalid_weight.inspect} should be invalid"
		end
	end

	test "valid target weights should be valid" do
		valid_weights = %w[20 510 220.4]

		valid_weights.each do |valid_weight|
			@user.target_weight = valid_weight
			assert @user.valid?, "#{valid_weight.inspect} should be valid"
		end
	end

	test "invalid target weights should be invalid" do
		invalid_weights = %w[-20 0 1000]

		invalid_weights.each do |invalid_weight|
			@user.target_weight = invalid_weight
			assert_not @user.valid?, "#{invalid_weight.inspect} should be invalid"
		end
	end

	test "valid macro percents should be valid" do
		valid_macros = %w[10 50 87]

		valid_macros.each do |valid_macro|
			@user.carb_percent = valid_macro
			@user.protein_percent = valid_macro
			@user.fat_percent = valid_macro
			assert @user.valid?, "#{valid_macro.inspect} should be valid"
		end
	end

	test "invalid macro percents should be invalid" do
		invalid_macros = %w[11.1 -50 101]

		invalid_macros.each do |invalid_macro|
			@user.carb_percent = invalid_macro
			@user.protein_percent = invalid_macro
			@user.fat_percent = invalid_macro
			assert_not @user.valid?, "#{invalid_macro.inspect} should be invalid"
		end
	end

	test "macro percents should add up to 100" do
		carb_macros = %w[40 10 90 60]
		protein_macros = %w[30 50 30]
		fat_macros = %w[30 40 10]

		invalid_macros.each do |invalid_macro|
			@user.carb_percent = invalid_macro
			@user.protein_percent = invalid_macro
			@user.fat_percent = invalid_macro
			assert_not @user.valid?, "#{invalid_macro.inspect} should be invalid"
		end
	end


end