require 'test_helper'

class FrequencyPointsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
