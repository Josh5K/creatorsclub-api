class User < ApplicationRecord
    has_secure_password
    has_and_belongs_to_many :sellers, join_table: :users_sellers
    accepts_nested_attributes_for :sellers
end
