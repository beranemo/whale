class Guest < ApplicationRecord
  belongs_to :country
  belongs_to :info_way
end
