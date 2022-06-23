class AddFormIdToAttendData < ActiveRecord::Migration[7.0]
  def change
    add_column :attend_data, :form_id, :integer
    add_column :attend_data, :local_id, :integer
  end
end
