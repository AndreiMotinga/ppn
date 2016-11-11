class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :text
      t.boolean :private

      t.timestamps
    end
  end
end
