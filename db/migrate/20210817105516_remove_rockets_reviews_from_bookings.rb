class RemoveRocketsReviewsFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :rocket_review, :text
    add_column :bookings, :user_id, :string
    add_column :bookings, :rocket_id, :string
  end
end
