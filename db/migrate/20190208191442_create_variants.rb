# frozen_string_literal: true

class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.integer :printful_variant_id
      t.string :name
      t.string :image
      t.decimal :cc_price
      t.decimal :seller_price
      t.integer :product_id
      t.string :color
      t.string :size

      t.timestamps
    end
  end
end
