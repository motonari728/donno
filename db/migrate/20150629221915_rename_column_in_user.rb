class RenameColumnInUser < ActiveRecord::Migration
  def change
  	rename_column :microposts, :user_id, :uuid
  	change_column :microposts, :uuid, :string, :limit => 36
  	change_column :users, :uuid, :string, :limit => 36
  	change_column :microposts, :content, :text
  end
end
