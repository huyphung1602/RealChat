class HomeController < ApplicationController
  def index
    @rooms = Room.all
    @room = Room.new
    @room.messages.build
  end
end
