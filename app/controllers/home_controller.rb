class HomeController < ApplicationController
  def index
    session[:chats] ||= []
    
    @users = User.all.where.not(id: current_user) 
    begin
      @chats = Chat.includes(:recipient, :messages).find(session[:chats])
    rescue ActiveRecord::RecordNotFound
      @chats = nil
    end
  end
end
