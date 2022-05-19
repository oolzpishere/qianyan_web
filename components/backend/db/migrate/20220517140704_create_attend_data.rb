class CreateAttendData < ActiveRecord::Migration[7.0]
  def change
    create_table :attend_data do |t|
      t.string :name

      t.string :group
      t.integer :timestamp

      t.timestamps
    end
  end
end
