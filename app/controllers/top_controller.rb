class TopController < ApplicationController
  
  def index
    
  end

  def search
    @rooms = Room.where("address LIKE ?", "%#{params[:area]}%")
  end
  
  
end
