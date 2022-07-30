class CreateEmailContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :email_contacts do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.string :replyaddress, null: false
      t.timestamps
    end
  end
end
