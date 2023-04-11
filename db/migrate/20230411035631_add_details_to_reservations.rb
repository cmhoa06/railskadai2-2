class AddDetailsToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :checkin_at, :date
    add_column :reservations, :checkout_at, :date
    add_column :reservations, :person_count, :integer
    add_column :reservations, :total_day, :integer
    add_column :reservations, :total_price, :integer
    add_column :reservations, :room_id, :integer
  end
end
