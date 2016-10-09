class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :booking_at
      t.references :user, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true
      t.references :theater, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
