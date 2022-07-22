require "application_system_test_case"

module Admin
  module Manager
    class LoginTest< ApplicationSystemTestCase
      include Devise::Test::IntegrationHelpers 

      def setup 
        @admin = create_admin
      end

      teardown do
      end

      test 'login' do
        sign_in @admin

        visit '/manager/articles' 
        assert_content "全部文章"
        assert_current_path "/manager/articles"
      end

      test "not login" do
        visit '/manager/articles'
        assert_content "管理员登录"
        assert_current_path "/admins/sign_in"
      end



    end
  end
end