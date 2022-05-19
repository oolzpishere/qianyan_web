module Backend
  class Year < ApplicationRecord
    self.table_name = :years 

    has_many :years_seasons
    has_many :seasons, through: :years_seasons
  end
end
