class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create]
  before_action :authorize, only: [:feed]

  def feed
    @user = User.find(params[:user_id])
    @friends = @user.friends
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)

    if @user.save
      session[:current_user] = @user.id

      # if user info is correct redirect user new route
      render :js => "window.location = '#{user_feed_path @user}'"
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
  end

  def confirm_deletion
    @user = User.find(params[:user_id])
  end

  def destroy
    session[:current_user] = nil
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  def search
    names = params[:search].split(' ')
    @users = User.where("(LOWER(first_name) LIKE '%#{params[:search]}%') OR (LOWER(last_name) LIKE '%#{params[:search]}%')")
    if @users.count == 0
      @users = User.where("first_name='#{names.first}' AND last_name='#{names.last}'")
    end
  end

  def search_autocomplete
    @users = User.where("(LOWER(first_name) LIKE '#{params[:data][:search]}%') OR (LOWER(last_name) LIKE '#{params[:data][:search]}%')")
    @names = {names: []}

    @users.each do |user|
      @names[:names] << "#{user.first_name} #{user.last_name}"
    end

    render json: @names
  end

  def friends
    @friends = User.find(params[:user_id]).friends
  end

  private
  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :comment, :avatar)
  end
end
