class CreateJsjForms < ActiveRecord::Migration[7.0]
  def change
    create_table :jsj_forms do |t|
      t.integer :conference_id
      t.string :form_identify
      t.string :name
      t.string :full_name
      t.string :description
      t.string :form_type
      t.string :all_use_data_type
      t.string :sign_up_link
      # fields:
      t.json :form_struct
      t.string :xml_fields
      # json or xml, default form_struct json
      t.string :use_fields_type

      t.timestamps
    end

    add_index :jsj_forms, :form_identify, unique: true

  end
end
