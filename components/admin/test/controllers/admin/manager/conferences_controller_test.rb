require "test_helper"

module Admin
  class Manager::ConferencesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @manager_conference = admin_manager_conferences(:one)
    end

    test "should get index" do
      get manager_conferences_url
      assert_response :success
    end

    test "should get new" do
      get new_manager_conference_url
      assert_response :success
    end

    test "should create manager_conference" do
      assert_difference("Manager::Conference.count") do
        post manager_conferences_url, params: { manager_conference: {  } }
      end

      assert_redirected_to manager_conference_url(Manager::Conference.last)
    end

    test "should show manager_conference" do
      get manager_conference_url(@manager_conference)
      assert_response :success
    end

    test "should get edit" do
      get edit_manager_conference_url(@manager_conference)
      assert_response :success
    end

    test "should update manager_conference" do
      patch manager_conference_url(@manager_conference), params: { manager_conference: {  } }
      assert_redirected_to manager_conference_url(@manager_conference)
    end

    test "should destroy manager_conference" do
      assert_difference("Manager::Conference.count", -1) do
        delete manager_conference_url(@manager_conference)
      end

      assert_redirected_to manager_conferences_url
    end
  end
end
