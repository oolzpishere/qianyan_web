require "test_helper"

module Admin
  class Manager::AttendDataControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @manager_attend_datum = admin_manager_attend_data(:one)
    end

    test "should get index" do
      get manager_attend_data_url
      assert_response :success
    end

    test "should get new" do
      get new_manager_attend_datum_url
      assert_response :success
    end

    test "should create manager_attend_datum" do
      assert_difference("Manager::AttendDatum.count") do
        post manager_attend_data_url, params: { manager_attend_datum: {  } }
      end

      assert_redirected_to manager_attend_datum_url(Manager::AttendDatum.last)
    end

    test "should show manager_attend_datum" do
      get manager_attend_datum_url(@manager_attend_datum)
      assert_response :success
    end

    test "should get edit" do
      get edit_manager_attend_datum_url(@manager_attend_datum)
      assert_response :success
    end

    test "should update manager_attend_datum" do
      patch manager_attend_datum_url(@manager_attend_datum), params: { manager_attend_datum: {  } }
      assert_redirected_to manager_attend_datum_url(@manager_attend_datum)
    end

    test "should destroy manager_attend_datum" do
      assert_difference("Manager::AttendDatum.count", -1) do
        delete manager_attend_datum_url(@manager_attend_datum)
      end

      assert_redirected_to manager_attend_data_url
    end
  end
end
