class RenameAdminToSuperadminOnUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :admin, :superadmin
  end
end
