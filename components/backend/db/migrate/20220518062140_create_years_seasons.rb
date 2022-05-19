class CreateYearsSeasons < ActiveRecord::Migration[7.0]
  def change
    create_table :years_seasons do |t|
      t.belongs_to :year, index: true
      t.belongs_to :season, index: true
      t.string :date_range
      
      t.timestamps
    end
  end
end
