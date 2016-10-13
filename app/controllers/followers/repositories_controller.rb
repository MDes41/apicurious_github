class Followers::RepositoriesController < ApplicationController
  def index
    @repos = GitHubUser.my_repos(params[:uid])
  end
end
