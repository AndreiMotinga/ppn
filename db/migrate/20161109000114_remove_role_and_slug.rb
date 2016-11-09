class RemoveRoleAndSlug < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :role
    remove_column :posts, :slug
  end
end
