class AddUniqIndexToCompanyFollowers < ActiveRecord::Migration[5.0]
  def change
    add_index :company_followers, [:company_id, :user_id], unique: true
  end
end
