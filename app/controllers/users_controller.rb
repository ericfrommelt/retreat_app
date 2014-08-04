class UsersController < ApplicationController

  def feed
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)

    if @user.save
      render :js => "window.location = '#{user_feed_path @user}'"
    end
  end

  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
