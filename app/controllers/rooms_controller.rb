class RoomsController < ApplicationController
	before_action :set_room, only: [:show, :edit, :update, :destroy]

	# GET /rooms
	# GET /rooms.json
	def index
		@rooms = Room.order(updated_at: :desc)
		respond_to do |format|
			format.html
			format.json { render json: @rooms }
		end
	end

	# GET /rooms/1
	# GET /rooms/1.json
	def show
		@uuid = params[:uuid]
		@user = User.find_by(uuid: @uuid)
		@donno = params[:donno]
		@wow = params[:wow] ? params[:wow] : 0
		logger.debug "テスト123020#{@donno}"
		if @donno == "true"
			@user.donno = true
		else
			@user.donno = false
		end
		@user.wow = @wow
		if @room.id != @user.room_id
			@user.room_id=@room.id
		end
		@user.touch
		@user.save


		@last = params[:last].to_i
		@microposts = @room.microposts.offset(@last)
		if @room.updated_at < 1.second.ago
			@users = @room.users.where(updated_at: (30.years.ago)..(Time.now))
			@donno_rate = 0
			@users.each do |user|
				if user.donno == true
					@donno_rate += 1
				end
			end
			@donno_rate = @donno_rate.to_f/@users.count

			@users = @room.users.where(updated_at: (5.years.ago)..(Time.now))
			@wow_rate = 0
			@users.each do |user|
				@wow_rate += user.wow
			end
			@wow_rate = @wow_rate.to_f/@users.count

			@room.donno = @donno_rate
			@room.wow = @wow_rate
			@room.touch
			@room.save
		else
			@donno = Room.find(params[:id]).donno
			@wow = Room.find(params[:id]).wow
		end
	end

	# GET /rooms/new
	def new
		@room = Room.new
	end

	# GET /rooms/1/edit
	def edit
	end

	# POST /rooms
	# POST /rooms.json
	def create
		@room = Room.new(room_params) 

		respond_to do |format|
			if @room.save
				format.html { redirect_to @room, notice: 'Room was successfully created.' }
				format.json { render json: @room, status: :created}
			else
				format.html { render :new }
				format.json { render json: @room.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /rooms/1
	# PATCH/PUT /rooms/1.json
	def update
		respond_to do |format|
			if @room.update(room_params)
				format.html { redirect_to @room, notice: 'Room was successfully updated.' }
				format.json { render :show, status: :ok, location: @room }
			else
				format.html { render :edit }
				format.json { render json: @room.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /rooms/1
	# DELETE /rooms/1.json
	def destroy
		@room.destroy
		respond_to do |format|
			format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_room
			@room = Room.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def room_params
			params.require(:room).permit(:room_name)
		end
end
