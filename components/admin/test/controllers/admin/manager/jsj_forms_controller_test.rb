require "test_helper"

module Admin
  class Manager::JsjFormsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @manager_jsj_form = admin_manager_jsj_forms(:one)
    end

    test "should get index" do
      get manager_jsj_forms_url
      assert_response :success
    end

    test "should get new" do
      get new_manager_jsj_form_url
      assert_response :success
    end

    test "should create manager_jsj_form" do
      assert_difference("Manager::JsjForm.count") do
        post manager_jsj_forms_url, params: { manager_jsj_form: {  } }
      end

      assert_redirected_to manager_jsj_form_url(Manager::JsjForm.last)
    end

    test "should show manager_jsj_form" do
      get manager_jsj_form_url(@manager_jsj_form)
      assert_response :success
    end

    test "should get edit" do
      get edit_manager_jsj_form_url(@manager_jsj_form)
      assert_response :success
    end

    test "should update manager_jsj_form" do
      patch manager_jsj_form_url(@manager_jsj_form), params: { manager_jsj_form: {  } }
      assert_redirected_to manager_jsj_form_url(@manager_jsj_form)
    end

    test "should destroy manager_jsj_form" do
      assert_difference("Manager::JsjForm.count", -1) do
        delete manager_jsj_form_url(@manager_jsj_form)
      end

      assert_redirected_to manager_jsj_forms_url
    end
  end
end
