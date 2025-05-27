require "test_helper"

class ReservationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reservation_new_url
    assert_response :success
  end

  test "should get create" do
    get reservation_create_url
    assert_response :success
  end

  test "should get edit" do
    get reservation_edit_url
    assert_response :success
  end

  test "should get update" do
    get reservation_update_url
    assert_response :success
  end
end
