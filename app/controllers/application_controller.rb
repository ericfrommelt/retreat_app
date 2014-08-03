class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def index
    render layout: 'application', text: ""
  end

  private

  def current_user
    User.find(session[:current_user]) if session[:current_user]
  end

  def authenticate
    if !session[:current_user]
      redirect_to root_path
    end
  end

  def authorize
    if params[:id] != session[:current_user] && params[:user_id] != session[:current_user]
      redirect_to root_path
    end
  end
end
