module Backend
  class Conference < ApplicationRecord
    self.table_name = :conferences

    belongs_to :subject
    has_many :jsj_forms
    has_many :forms
  end
end
