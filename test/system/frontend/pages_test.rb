require "application_system_test_case"

module Frontend
  class PagesTest < ApplicationSystemTestCase

    def setup 
    end

    teardown do
    end

    test "visiting the index" do
      visit "/"
      # header
      assert_content "首页\n前沿课堂\n学时证明"
      # body
      assert_content "2022年春“前沿课堂”全国小学教学观摩研讨会学时证明查询"
      # footer
      assert_content "版权@北京前沿课堂教育科技有限公司\n地址：北京市海淀区马甸桥东19号金澳国际2206室\n电话：010-62048760"
    end

    test "visiting the certifications/search" do
      visit 'certifications/search'

      assert_content "2022年春“前沿课堂”\n全国小学教学观摩研讨会\n学时证明查询\n姓名:\n电话:"
    end

  end
end