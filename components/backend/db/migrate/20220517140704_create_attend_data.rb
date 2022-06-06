class CreateAttendData < ActiveRecord::Migration[7.0]
  def change
    create_table :attend_data do |t|
      t.integer :conference_id
      t.integer :jsj_form_id

      t.string :name
      t.string :phone
      t.string :email
      t.string :school
      t.string :way
      t.string :occupation
      t.string :openid
      t.string :unionid

      t.boolean :payed
      t.boolean :allow_to_print

      t.string :group
      # for grouping 
      t.integer :timestamp

      t.integer :jsj_id
      t.json :entry
      t.boolean :deleted
      t.string :trade_no
      t.string :bank_transfer_confirm
      t.string :jsj_created_at
      t.string :jsj_updated_at

      t.timestamps
    end

    # index conference_id
    # index form_id
  end
end
