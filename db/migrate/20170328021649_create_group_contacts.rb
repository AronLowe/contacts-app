class CreateGroupContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :group_contacts do |t|
      t.string :group_id
      t.string :contact_id

      t.timestamps
    end
  end
end
