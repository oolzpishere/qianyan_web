module Backend
  class Article < ApplicationRecord
    self.table_name = :articles
    has_many :articles_article_tags
    has_many :article_tags, through: :articles_article_tags

    has_rich_text :content
  end
end
