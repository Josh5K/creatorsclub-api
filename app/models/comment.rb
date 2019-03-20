# frozen_string_literal: true

class Comment < ApplicationRecord
  has_many :reply
  belongs_to :product
end
