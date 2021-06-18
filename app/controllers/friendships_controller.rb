class FriendshipsController < ApplicationController
  def create
  end

  def destroy
    friendship = current_user.friendships.find(friend_id: params[:id])
    friendship.destroy
    flash[:success] = "Friendship deleted :("
    redirect_to  friendship_path
  end
end
