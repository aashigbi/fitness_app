require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_path
    assert_response :success
  end

  test "should get goals" do
    get users_goals_path
    assert_response :success
  end

  test "current weight should be a number" do
  	get users_goals_path
  	@user.

end
