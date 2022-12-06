class RoomsController < ApplicationController
    def index
     @rooms = Room.where("address LIKE ?", "%#{params[:area]}%")
    end


    def new
      @room = Room.new
    end

    def create
      @room = Room.new(params.require(:room).permit(:title, :introduction, :price, :address, :image))
      @room.image.attach(params[:room][:image])
      @room.user_id = current_user.id
      if @room.save
        redirect_to root_path
      else
        render "new"
      end
    end

    def register
      @user = current_user
      @rooms = @user.rooms
      
    end



end
