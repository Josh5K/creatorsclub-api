# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :variant
  belongs_to :seller
  has_many :comment
end
