class CreateColumnAtUser < ActiveRecord::Migration
  def change
    add_column :users, :wow_updated, :timestamp
  end
end
