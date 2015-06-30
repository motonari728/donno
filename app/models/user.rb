class User < ActiveRecord::Base
	#has_many :microposts, dependent: :destroy
	belongs_to :room
end
