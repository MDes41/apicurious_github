class FollowersController < ApplicationController
  def index
    @followers = current_user.followers
  end

  def show
    byebug
    @follower
  end
end
