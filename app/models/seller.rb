# frozen_string_literal: true

class Seller < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_sellers
  accepts_nested_attributes_for :users
  has_many :product

  def to_s
    seller_name
  end
end
