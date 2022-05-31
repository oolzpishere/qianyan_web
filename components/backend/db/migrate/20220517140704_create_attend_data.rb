class CreateAttendData < ActiveRecord::Migration[7.0]
  def change
    create_table :attend_data do |t|
      t.integer :conference_id
      t.integer :form_id

      t.string :name
      t.string :phone
      t.string :email
      t.string :school

      t.string :group
      t.integer :timestamp

      t.timestamps
    end

    # index conference_id
    # index form_id
  end
end
