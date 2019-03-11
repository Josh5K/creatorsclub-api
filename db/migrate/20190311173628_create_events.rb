class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :ip_address
      t.string :api_key_used

      t.timestamps
    end
  end
end
