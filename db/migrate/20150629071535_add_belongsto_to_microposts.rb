class AddBelongstoToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :user_id, :integer
    add_column :microposts, :room_id, :integer
    add_index :microposts, :user_id
    add_index :microposts, :room_id
    change_column :microposts, :user_id, :integer, :null => false
    change_column :microposts, :room_id, :integer, :null => false
  end
end
