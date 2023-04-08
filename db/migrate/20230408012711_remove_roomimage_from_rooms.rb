class RemoveRoomimageFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :roomimage, :string
  end
end
