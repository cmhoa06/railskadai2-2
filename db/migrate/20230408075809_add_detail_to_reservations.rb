class AddDetailToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :total_price, :integer
    add_column :reservations, :total_day, :integer
  end
end
