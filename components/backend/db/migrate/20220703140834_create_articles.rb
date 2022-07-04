class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.json :tags

      t.string :title
      # t.text :content
      t.string :author
      t.string :source_url

      t.timestamps
    end
  end
end
