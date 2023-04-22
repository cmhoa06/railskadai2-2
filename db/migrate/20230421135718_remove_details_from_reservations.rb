class RemoveDetailsFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :total_day, :integer
    remove_column :reservations, :total_price, :integer
  end
end
