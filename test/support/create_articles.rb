module CreateArticles

  def create_articles
    Backend::Article.create([
        { title: "Test Title", 
          content: "Test Content", 
          # article_tags:
          author: "Test Author",
          source_url: "Test Source URL" },
    ])

  end

end
