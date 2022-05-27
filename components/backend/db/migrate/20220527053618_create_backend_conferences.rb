class CreateBackendConferences < ActiveRecord::Migration[7.0]
  def change
    create_table :conferences do |t|
      

      t.timestamps
    end
  end
end
