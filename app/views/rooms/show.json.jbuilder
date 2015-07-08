json.room_name @room.room_name
json.microposts @microposts,  :id, :content, :uuid, :created_at
json.donno @donno_rate
json.wow @wow_rate
