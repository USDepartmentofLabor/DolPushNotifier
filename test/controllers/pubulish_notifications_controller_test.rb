require 'test_helper'

class PubulishNotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pubulish_notification = pubulish_notifications(:one)
  end

  test "should get index" do
    get pubulish_notifications_url
    assert_response :success
  end

  test "should get new" do
    get new_pubulish_notification_url
    assert_response :success
  end

  test "should create pubulish_notification" do
    assert_difference('PubulishNotification.count') do
      post pubulish_notifications_url, params: { pubulish_notification: {  } }
    end

    assert_redirected_to pubulish_notification_url(PubulishNotification.last)
  end

  test "should show pubulish_notification" do
    get pubulish_notification_url(@pubulish_notification)
    assert_response :success
  end

  test "should get edit" do
    get edit_pubulish_notification_url(@pubulish_notification)
    assert_response :success
  end

  test "should update pubulish_notification" do
    patch pubulish_notification_url(@pubulish_notification), params: { pubulish_notification: {  } }
    assert_redirected_to pubulish_notification_url(@pubulish_notification)
  end

  test "should destroy pubulish_notification" do
    assert_difference('PubulishNotification.count', -1) do
      delete pubulish_notification_url(@pubulish_notification)
    end

    assert_redirected_to pubulish_notifications_url
  end
end
