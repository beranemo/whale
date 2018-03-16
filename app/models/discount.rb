class Discount < ApplicationRecord
  belongs_to :product
  belongs_to :bulletin
end
