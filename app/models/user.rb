class User < ActiveRecord::Base
	#has_many :microposts, dependent: :destroy
	belongs_to :room
	validates(:wow, numericality: {less_than:11})
end
