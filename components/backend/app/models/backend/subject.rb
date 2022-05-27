module Backend
  class Subject < ApplicationRecord
    self.table_name = :subjects
    
    has_many :conferences
  end
end
