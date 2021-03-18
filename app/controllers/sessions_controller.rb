#require 'pry'
class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])

    return flash[:alert] = "Incorrect User" unless @user.authenticate(params[:password])
    #binding.pry
    session[:user_id] = @user.id
  end

  def destroy
    session.delete(:user_id)
  end

end
