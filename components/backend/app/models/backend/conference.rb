module Backend
  class Conference < ApplicationRecord
    self.table_name = :conferences

    belongs_to :subject
  end
end
