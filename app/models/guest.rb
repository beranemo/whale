class Guest < ApplicationRecord
  validates_presence_of :guest_type, :country, :age, :info_way

  belongs_to :country
  belongs_to :info_way
  belongs_to :guest_type
  belongs_to :age
end
