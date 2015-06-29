class AddIndexToRooms < ActiveRecord::Migration
  def change
  	add_index :rooms, :room_name, unique: true
  end
end
