require 'test_helper'

class StudentControllerTest < ActionController::TestCase
  test "should get assignment" do
    get :assignment
    assert_response :success
  end

end
