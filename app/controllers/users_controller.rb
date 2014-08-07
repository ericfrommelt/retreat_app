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
      session[:current_user] = @user.id

      # if user info is correct redirect user new route
      # render :js => "window.location = '#{user_feed_path @user}'"
      redirect_to @user
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(users_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    session[:current_user] = nil
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  def search
    @users = User.where("LOWER(first_name) LIKE '%#{params[:search]}%'")
  end

  def friends
    @friends = User.find(params[:user_id]).friends
  end

  private
  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end
end
