class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:success] = "Following friend"
    else
      flas[:error] = "Something wrong"
    end
    redirect_to friend_path
  end

  def destroy
    friendship = current_user.friendships.find(friend_id: params[:id]).first
    friendship.destroy
    flash[:success] = "Friendship deleted :("
    redirect_to  friendship_path
  end
end
