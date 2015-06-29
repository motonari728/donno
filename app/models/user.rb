class User < ActiveRecord::Base
	has_many: microposts
	belongs_to: room
end
