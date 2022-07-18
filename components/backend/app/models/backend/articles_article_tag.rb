module Backend
  class ArticlesArticleTag < ApplicationRecord
    self.table_name = :articles_article_tags

    belongs_to :article, optional: true
    belongs_to :external_article, optional: true
    belongs_to :article_tag
  end
end
