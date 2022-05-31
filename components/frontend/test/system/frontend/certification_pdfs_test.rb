require "application_system_test_case"

module Frontend
  class CertificationPdfsTest < ApplicationSystemTestCase
    setup do
      @certification_pdf = frontend_certification_pdfs(:one)
    end

    test "visiting the index" do
      visit certification_pdfs_url
      assert_selector "h1", text: "Certification pdfs"
    end

    test "should create certification pdf" do
      visit certification_pdfs_url
      click_on "New certification pdf"

      click_on "Create Certification pdf"

      assert_text "Certification pdf was successfully created"
      click_on "Back"
    end

    test "should update Certification pdf" do
      visit certification_pdf_url(@certification_pdf)
      click_on "Edit this certification pdf", match: :first

      click_on "Update Certification pdf"

      assert_text "Certification pdf was successfully updated"
      click_on "Back"
    end

    test "should destroy Certification pdf" do
      visit certification_pdf_url(@certification_pdf)
      click_on "Destroy this certification pdf", match: :first

      assert_text "Certification pdf was successfully destroyed"
    end
  end
end
