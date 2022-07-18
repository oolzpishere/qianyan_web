module Backend
  class ExternalArticle < ApplicationRecord
    self.table_name = :external_articles
    
    has_many :articles_article_tags
    has_many :article_tags, through: :articles_article_tags

  end
end
