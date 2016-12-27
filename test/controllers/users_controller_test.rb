require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.new()

  test "should get new" do
    get users_new_path
    assert_response :success
  end

  test "should get goals" do
    get users_goals_path
    assert_response :success
  end

end
