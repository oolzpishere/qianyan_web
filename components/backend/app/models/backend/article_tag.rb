module Backend
  class ArticleTag < ApplicationRecord
    self.table_name = :article_tags

    has_many :articles_article_tags
    has_many :articles, through: :articles_article_tags
  end
end
