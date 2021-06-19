class UsersController < ApplicationController

  def my_portfolio
    @tracked_stocks = current_user.stocks
    @user = current_user
  end

  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      if @friends
        respond_to do |format|
          format.js { render partial: 'users/friend_result'}
        end
      else
        respond_to do |format|
          format.js { render partial: 'users/friend_result'}
          flash.now[:alert] = "Couldn't find user"
        end
      end
    else
      respond_to do |format|
        format.js { render partial: 'users/friend_result'}
        flash.now[:alert] = "Please enter a name or email"
      end
    end
  end

  def my_friends
    @my_friends = current_user.friends
  end

  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end


end
