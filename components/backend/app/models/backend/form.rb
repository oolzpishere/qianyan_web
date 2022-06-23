module Backend
  class Form < ApplicationRecord
    self.table_name = :forms

    belongs_to :conference

  end
end
