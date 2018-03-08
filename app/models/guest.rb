class Guest < ApplicationRecord
  belongs_to :country
  belongs_to :sex
  belongs_to :info_way
end
