require 'securerandom'

namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do #populate: データを入れる,入植させる
		make_rooms
		make_users
		make_microposts
	end
end

def make_rooms
	10.times do |n|
		room_name = Faker::Name.name
		Room.create!( room_name: room_name )
	end
end


def make_users
		uuid = "XXX"
		room_id = 1
		User.create!( uuid: uuid, room_id: room_id )
	100.times do |n|
		uuid = SecureRandom.uuid # => "96b0a57c-d9ae-453f-b56f-3b154eb10cda"
		room_id = 1
		User.create!( uuid: uuid, room_id: room_id )
	end
end

def make_microposts
	users = User.all
		room_id = 1
		users.each do |user|
			content = Faker::Lorem.sentence(5)
			Micropost.create!( content: content, room_id: room_id, uuid: user.uuid )
		end
end
