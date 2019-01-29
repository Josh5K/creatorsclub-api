class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.int :user_id
      t.int :comment_id
      t.text :comment

      t.timestamps
    end
  end
end
