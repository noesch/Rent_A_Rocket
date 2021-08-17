class Booking < ApplicationRecord
  belongs_to :rocket
  belongs_to :user
  has_one :review
end
