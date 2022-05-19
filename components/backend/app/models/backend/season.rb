module Backend
  class Season < ApplicationRecord
    self.table_name = :seasons

    has_many :years_seasons
    has_many :years, through: :years_seasons
  end
end
