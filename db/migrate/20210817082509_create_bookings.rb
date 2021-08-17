class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.text :status
      t.text :user_review
      t.text :rocket_review

      t.timestamps
    end
  end
end
