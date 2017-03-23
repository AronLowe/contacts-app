class UpdateBioName < ActiveRecord::Migration[5.0]
  def change
    rename_column :contacts, :Bio, :bio
  end
end
