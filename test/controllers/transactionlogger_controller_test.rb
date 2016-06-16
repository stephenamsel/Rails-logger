require 'test_helper'

class TransactionloggerControllerTest < ActionController::TestCase
  test "should get month" do
    get :month
    assert_response :success
  end

  test "should get alltime" do
    get :alltime
    assert_response :success
  end

end
