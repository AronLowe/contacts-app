class AddBioAttritbute < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :Bio, :text
  end
end
