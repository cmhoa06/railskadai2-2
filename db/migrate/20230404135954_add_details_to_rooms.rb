class AddDetailsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :roomname, :string
    add_column :rooms, :description, :text
    add_column :rooms, :price, :integer
    add_column :rooms, :address, :string
    add_column :rooms, :roomimage, :string
  end
end
