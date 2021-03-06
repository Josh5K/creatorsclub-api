# frozen_string_literal: true

class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.integer :user_id
      t.integer :comment_id
      t.text :reply

      t.timestamps
    end
  end
end
