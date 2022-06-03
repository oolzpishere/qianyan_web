module Backend
  class JsjForm < ApplicationRecord
    self.table_name = :jsj_forms

    belongs_to :conference
    
  end
end
