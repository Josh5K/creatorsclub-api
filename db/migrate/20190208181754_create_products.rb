class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :printful_id
      t.string :name
      t.integer :seller_id

      t.timestamps
    end
  end
end
