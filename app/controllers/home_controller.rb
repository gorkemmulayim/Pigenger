class HomeController < ApplicationController
  def index
    session[:chats] ||= []
 
    @friends = User.all.where(id: Friendship.all.where(user_id: current_user.id).select("friend_id"))
    begin
      @chats = Chat.includes(:recipient, :messages).find(session[:chats])
    rescue ActiveRecord::RecordNotFound
      @chats = nil
    end
  end
end
