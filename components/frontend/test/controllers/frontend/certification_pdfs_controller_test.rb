require "test_helper"

module Frontend
  class CertificationPdfsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @certification_pdf = frontend_certification_pdfs(:one)
    end

    test "should get index" do
      get certification_pdfs_url
      assert_response :success
    end

    test "should get new" do
      get new_certification_pdf_url
      assert_response :success
    end

    test "should create certification_pdf" do
      assert_difference("CertificationPdf.count") do
        post certification_pdfs_url, params: { certification_pdf: {  } }
      end

      assert_redirected_to certification_pdf_url(CertificationPdf.last)
    end

    test "should show certification_pdf" do
      get certification_pdf_url(@certification_pdf)
      assert_response :success
    end

    test "should get edit" do
      get edit_certification_pdf_url(@certification_pdf)
      assert_response :success
    end

    test "should update certification_pdf" do
      patch certification_pdf_url(@certification_pdf), params: { certification_pdf: {  } }
      assert_redirected_to certification_pdf_url(@certification_pdf)
    end

    test "should destroy certification_pdf" do
      assert_difference("CertificationPdf.count", -1) do
        delete certification_pdf_url(@certification_pdf)
      end

      assert_redirected_to certification_pdfs_url
    end
  end
end
