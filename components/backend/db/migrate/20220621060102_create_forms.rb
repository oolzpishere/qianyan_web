class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.integer :conference_id

      t.string :form_identify
      t.string :name
      t.string :full_name
      t.string :description
      t.string :form_type

      t.timestamps
    end

    add_index :forms, :form_identify, unique: true
  end
end
