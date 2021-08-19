class Rocket < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def last_booking
    bookings.order(created_at: :desc).first
  end
end
