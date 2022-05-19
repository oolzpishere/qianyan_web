class CreateYears < ActiveRecord::Migration[7.0]
  def change
    create_table :years do |t|
      t.integer :year

      t.timestamps
    end
  end
end
