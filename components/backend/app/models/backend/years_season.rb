module Backend
  class YearsSeason < ApplicationRecord
    self.table_name = :years_seasons

    belongs_to :year
    belongs_to :season
  end
end
