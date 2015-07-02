class Room < ActiveRecord::Base
	has_many :users
	has_many :microposts, dependent: :destroy
	validates :room_name, uniqueness: true, length: {maximum: 100}, presence: true
end
 