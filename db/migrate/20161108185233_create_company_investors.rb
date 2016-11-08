class CreateCompanyInvestors < ActiveRecord::Migration[5.0]
  def change
    create_table :company_investors do |t|
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
