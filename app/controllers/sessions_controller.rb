require 'pry'
class SessionsController < ApplicationController
  def new
  end

  def create
    @user =  User.find_by(name: params[:user][:name]) # if it returns an object it will be true else nil
    #binding.pry
    if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id

    redirect_to home_path #contoller: "welcome", action: "home"
  else
    redirect_to controller: "sessions", action: "new"
    #binding.pry
    #return flash[:alert] = "Incorrect User" unless @user.authenticate(params[:password])
    #return flash[:alert] = "Incorrect User" unless params[:password] == @user.password
  end
  end

  def destroy
    session.delete(:user_id)
  end

end
