class FollowersController < ApplicationController
  def index
    @followers = current_user.followers
  end

  def show
    @git_hub_user = GitHubUser.find(params[:uid]).first
  end
end
