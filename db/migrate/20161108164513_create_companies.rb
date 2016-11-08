class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
