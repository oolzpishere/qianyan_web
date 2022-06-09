module Backend
  class AttendDatum < ApplicationRecord
    self.table_name = :attend_data

    belongs_to :conference
    belongs_to :jsj_form

  end
end
