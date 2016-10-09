class AddAmountToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :amount, :decimal
  end
end
