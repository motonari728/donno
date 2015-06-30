class AddIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :donno, :boolean, default: false
    add_column :users, :wow, :boolean, default: false
    add_column :users, :room_id, :integer
    add_index :users, :uuid, unique: true
    add_index :users, :room_id
    change_column :users, :uuid, :string, :null=>false
  end
end
