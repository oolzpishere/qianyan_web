class CreateArticlesArticleTags < ActiveRecord::Migration[7.0]
  def change
    create_table :articles_article_tags, id: false do |t|
      t.belongs_to :article
      t.belongs_to :article_tag

      # t.timestamps
    end
  end
end
