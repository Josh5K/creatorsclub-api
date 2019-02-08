class Product < ApplicationRecord
    has_many :variant
    belongs_to :seller
end
