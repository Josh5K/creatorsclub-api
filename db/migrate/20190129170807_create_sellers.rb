class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.string :category_name
      t.boolean :active

      t.timestamps
    end
  end
end