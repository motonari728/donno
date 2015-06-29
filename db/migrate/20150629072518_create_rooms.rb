class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_name

      t.timestamps null: false
    end
  	change_column :rooms, :room_name, :string, :null => false
  end
end
