class Guest < ApplicationRecord
  belongs_to :country
  belongs_to :info_way
  belongs_to :guest_type
  belongs_to :age
end
