class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :image
      t.string :name
      t.text :introduction
      t.integer :fee
      t.string :address
      
      t.timestamps
    end
  end
end
