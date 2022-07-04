module Backend
  class Article < ApplicationRecord
    self.table_name = :articles

    has_rich_text :content
  end
end
