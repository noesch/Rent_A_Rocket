class RemoveUserReviewsFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :user_review, :text
  end
end
