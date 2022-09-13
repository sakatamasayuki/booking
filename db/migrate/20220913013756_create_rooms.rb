class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :room_name
      t.string :room_intro
      t.integer :price
      t.string :address
      t.string :room_pic

      t.timestamps
    end
  end
end
