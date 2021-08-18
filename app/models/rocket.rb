class Rocket < ApplicationRecord
  belongs_to :user
  has_many :bookings

  def last_booking
    bookings.order(created_at: :desc).first
  end
end
