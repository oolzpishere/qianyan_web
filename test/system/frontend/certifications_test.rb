require "application_system_test_case"

module Frontend
  class CertificationsTest< ApplicationSystemTestCase

    def setup 
    end

    teardown do
    end

    test "normal fail search" do
      visit 'certifications/search'
      assert_content "2022年春“前沿课堂”\n全国小学语文、数学、英语\n教学观摩研讨会学时证明查询"

      fill_in "name", with: "test"
      fill_in "phone", with: "123456789"
      click_button "查询"

      assert_content "未找到您的报名信息，请重新查询； 如有疑问，请联系组委会工作人员。"
    end
    



  end
end