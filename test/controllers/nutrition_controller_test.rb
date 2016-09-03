require 'test_helper'

class NutritionControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get nutrition_display_url
    assert_response :success
  end

end
