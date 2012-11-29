require "pusher"

Pusher.app_id = '32649'
Pusher.key = '2d8d38de9d63a31169b9'
Pusher.secret = 'fd6a8b118e5e31dcc2f8'

class AppController < ApplicationController
  def chat
    Pusher['realtime-chat'].trigger('chat', {:message => params[:message], :username => params[:user]})
    render :nothing => true
  end
end