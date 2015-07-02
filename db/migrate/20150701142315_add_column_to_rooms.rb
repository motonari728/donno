class AddColumnToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :donno, :float, default: 0
    add_column :rooms, :wow, :float, default: 0
  end
end
