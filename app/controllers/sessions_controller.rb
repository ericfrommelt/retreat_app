class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:current_user] = @user.id
      render :js => "window.location = '#{user_feed_path @user}'"
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_path
  end

end
