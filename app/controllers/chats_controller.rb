class ChatsController < ApplicationController
  def create
    @chat = Chat.get(current_user.id, params[:user_id])
    
    add_to_chats unless chated?

    respond_to do |format|
      format.js
    end
  end

  private

  def add_to_chats
    session[:chats] ||= []
    session[:chats] << @chat.id
  end

  def chated?
    session[:chats].include?(@chat.id)
  end
end
