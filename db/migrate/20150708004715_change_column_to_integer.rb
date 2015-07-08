class ChangeColumnToInteger < ActiveRecord::Migration
  def change
  	change_column :users, :wow, :integer, default: 0
  end
end
