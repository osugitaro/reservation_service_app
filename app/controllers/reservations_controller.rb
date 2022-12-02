class ReservationsController < ApplicationController
 before_action :authenticate_user!, only: [:confirm]


    def new
        @reservation = Reservation.new
        @room = Room.find_by(id: params[:id])
        @user = @room.user
    end

    def confirm
        @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :room_id, :user_id))
        @room = Room.find(params[:reservation][:id])
        @reservation.room_id = @room.id
        s_date = @reservation.start_date
        e_date = @reservation.end_date
      
        @number_of_days = (e_date - s_date).to_i
        @total_price = @room.price * @reservation.number_of_people * @number_of_days
    end

    def create
        @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :room_id, :user_id))
        @room = Room.find(params[:reservation][:id])
        @reservation.room_id = @room.id
        @user = @room.user
        if params[:back] || !@reservation.save
          render :new
        elsif @reservation.save
          redirect_to reservation_path(@reservation)
        end
    end

    def show
      @reservation = Reservation.find(params[:id])
      @reservation.user_id = current_user
      @room = @reservation.room
    end

    def reserved
      @user = current_user
      @reservations = @user.reservations
    end


    
end
