class UsersController < ApplicationController

  def feed
    @users = User.all
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
    @users = User.where("LOWER(first_name) LIKE '%#{params[:search]}%'")#.where.not("#{params[:search] != current_user.first_name.downcase}")
  end

  private
  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
