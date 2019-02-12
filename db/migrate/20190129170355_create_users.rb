class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :password_digest
      t.string :email
      t.string :profile_picture
      t.string :youtube
      t.string :twitter
      t.string :facebook
      t.string :twitch
      t.text :about

      t.timestamps
    end
  end
end
