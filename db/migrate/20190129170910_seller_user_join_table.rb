class SellerUserJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users_sellers, :id => false do |t|
      t.integer :user_id
      t.integer :seller_id
    end
  end
end
