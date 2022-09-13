class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :room_id
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :person_num
      t.integer :total_price

      t.timestamps
    end
  end
end
