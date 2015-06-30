class ChangeUuidToString < ActiveRecord::Migration
	def change
		change_column :users, :uuid, :string
	end
end
