require 'pry'
class UsersController < ApplicationController

  def new
  end

  def create
<<<<<<< HEAD
    if params["user"]["password"] == params["user"]["password_confirmation"]

    @user = User.create(user_params)
    session[:user_id] = @user.id
  #  binding.pry
  else
    redirect_to "/users/new"
=======
    if params["user"]["password"] == params["user"][:password_confirmation]
      binding.pry
    @user = User.create(user_params)
  else
    redirect_to "users/new"
>>>>>>> f7447cb3719ac918f90b1a9dd59a6dcad6faefd8
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
