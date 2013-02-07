require 'test_helper'

class OeloControllerTest < ActionController::TestCase
  test "should get mateo" do
    get :mateo
    assert_response :success
  end

  test "should get sara" do
    get :sara
    assert_response :success
  end

end
