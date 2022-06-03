class CreateConferences < ActiveRecord::Migration[7.0]
  def change
    create_table :conferences do |t|
      t.integer :subject_id

      t.string :name
      t.string :full_name
      t.string :sms_conf_name
      # t.string :eng_name
      t.integer :year
      t.string :season
      t.string :subject_eng_name
      t.string :type
      t.date :start_date
      t.date :finish_date
      t.boolean :active 

      t.timestamps
    end

    # add_index :conferences, :eng_name, unique: true

  end
end
