class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.integer :category
      t.boolean :active
      t.string :seller_title
      t.string :seller_name
      t.timestamps
    end
  end
end
