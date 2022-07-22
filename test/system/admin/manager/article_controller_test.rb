require "application_system_test_case"

module Admin
  module Manager
    class ArticleControllerTest< ApplicationSystemTestCase
      include Devise::Test::IntegrationHelpers 

      def setup 
        @admin = create_admin
        sign_in @admin
      end

      teardown do
      end

      test 'index' do
        visit '/manager/articles' 
        assert_content "全部文章"
      end

      test 'new' do
        visit '/manager/articles/new'
        fill_in('article[title]', with: 'Test Title')
        page.find('#article_content').click.set('Test Content')
        # fill_in('article_tags', with: 'Test Tag')
        fill_in('article[author]', with: 'Test Author')
        fill_in('article[source_url]', with: 'Test Source URL')

        click_button('commit')
        # byebug
        # assert_content "Article was successfully created."
        sleep 0.1
        assert_equal 1, Backend::Article.count

        assert_content 'Test Title'
        assert_content 'Test Author'
        assert_equal "<div class=\"trix-content\">\n  <div>Test Content</div>\n</div>\n", 
                      Backend::Article.last.content.body.to_s
        assert_equal 'Test Source URL', Backend::Article.last.source_url
      end

      test 'edit' do
        create_articles
        visit '/manager/articles/1/edit' 

        fill_in('article[title]', with: 'Test Title2')
        click_button('commit')

        assert_content 'Test Title2'
      end

      test 'show' do
        create_articles
        visit '/manager/articles/1' 

        assert_content 'Test Title'
      end


    end
  end
end