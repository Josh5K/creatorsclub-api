# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_311_173_628) do
  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.integer 'resource_id'
    t.string 'author_type'
    t.integer 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'api_key'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'comments', force: :cascade do |t|
    t.integer 'user_id'
    t.text 'comment'
    t.integer 'product_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'events', force: :cascade do |t|
    t.string 'name'
    t.string 'ip_address'
    t.string 'api_key_used'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'products', force: :cascade do |t|
    t.integer 'printful_id'
    t.string 'name'
    t.string 'description'
    t.integer 'seller_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'replies', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'comment_id'
    t.text 'reply'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'sellers', force: :cascade do |t|
    t.integer 'category'
    t.boolean 'active'
    t.string 'seller_title'
    t.string 'seller_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'password'
    t.string 'password_digest'
    t.string 'email'
    t.string 'profile_picture'
    t.string 'youtube'
    t.string 'twitter'
    t.string 'facebook'
    t.string 'twitch'
    t.text 'about'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users_sellers', id: false, force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'seller_id'
  end

  create_table 'variants', force: :cascade do |t|
    t.integer 'printful_variant_id'
    t.string 'name'
    t.string 'image'
    t.decimal 'cc_price'
    t.decimal 'seller_price'
    t.integer 'product_id'
    t.string 'color'
    t.string 'size'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
