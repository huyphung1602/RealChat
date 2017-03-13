class MessagesController < ApplicationController
  def index
    set_room
    @messages = @room.messages

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    set_room
    @message = @room.messages.build message_params

    if @message.save
      unless current_user
        session[:current_user] = @message.username
      end
      redirect_to @room
    else
      flash[:error] = "Error #{@message.errors.full_messages.to_sentence}"
      redirect_back fallback_location: room_path(@room)
    end
  end

  private
    def set_room
      @room = Room.find(params[:room_id])
    end

    def message_params
      params.require(:message).permit(:body, :username)
    end
end
