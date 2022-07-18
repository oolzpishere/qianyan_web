class CreateBackendExternalArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :external_articles do |t|
      t.string :title
      # t.text :content
      t.string :author
      t.string :source_url

      t.timestamps
    end
  end
end
