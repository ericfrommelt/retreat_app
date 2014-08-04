class UsersController < ApplicationController

  def feed
<<<<<<< HEAD
    @users = User.all
=======
>>>>>>> bf857821f44aead288fb344cda6eea6aa04e39de
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)

    if @user.save

      # if user info is correct redirect user new route
      render :js => "window.location = '#{user_feed_path @user}'"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def search

  end

  private
  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
