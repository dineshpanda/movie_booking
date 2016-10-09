class AddTicketFeeToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :ticket_fee, :decimal
  end
end
