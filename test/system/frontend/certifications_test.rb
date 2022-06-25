require "application_system_test_case"

module Frontend
  class CertificationsTest< ApplicationSystemTestCase

    def setup 
      create_subjects
      create_confs
      create_jsj_forms
      create_attend_data
    end

    teardown do
    end

    test "fail search" do
      visit 'certifications/search'
      assert_content "2022年春“前沿课堂”\n全国小学语文、数学、英语\n教学观摩研讨会学时证明查询"

      fill_in "certification_search[name]", with: "test"
      fill_in "certification_search[phone]", with: "123456789"
      click_button "查询"

      assert_content "未找到您的报名信息，请重新查询； 如有疑问，请联系组委会工作人员。"
    end
    
    test "success search" do
      visit 'certifications/search'
      assert_content "2022年春“前沿课堂”\n全国小学语文、数学、英语\n教学观摩研讨会学时证明查询"

      fill_in "certification_search[name]", with: "测试1"
      fill_in "certification_search[phone]", with: "12345678901"
      click_button "查询"

      assert_content "参与会议 姓名 电话 学校 下载证书 打印证书"
      assert_content "2022年春“前沿课堂”小学数学教学观摩研讨会 测试1 12345678901 测试学校1\n下载证书\n打印证书"

      Jsj::RenderPdfs::Render.any_instance.expects(:render_guangxi_pdf).with({
          name: "测试1",
          date_range_str: "5月26 - 27日",
          subject_name: "小学数学"
        })

      click_link "打印证书"
    end

    test "country pdf" do
      visit 'certifications/search'

      fill_in "certification_search[name]", with: "测试2"
      fill_in "certification_search[phone]", with: "12345678902"
      click_button "查询"

      assert_content "参与会议 姓名 电话 学校 下载证书 打印证书"
      assert_content "2022年春“前沿课堂”小学数学教学观摩研讨会 测试2 12345678902 测试学校2\n下载证书\n打印证书"

      Jsj::RenderPdfs::Render.any_instance.expects(:render_country_pdf).with({
          name: "测试2",
          date_range_str: "5月26 - 27日",
          subject_name: "小学数学"
        })

      click_link "打印证书"
    end

  end
end