class FriendRequestsController < ApplicationController

  before_action :authenticate
  # before_action :authorize, only[:index]

  def create
    @friend_request = FriendRequest.create(friend_request_params)
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.destroy
  end

  def accept
    @friend_request = FriendRequest.find(params[:id])
    @friendship = Friendship.create(user: @friend_request.user, friend: @friend_request.sender)
    @friend_request.destroy

    redirect_to user_path(current_user)
  end

  def reject
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.destroy

    redirect_to user_path(current_user)
  end

  private
  def friend_request_params
    params.require(:friend_request).permit(:user_id, :sender_id)
  end

end
