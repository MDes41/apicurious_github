class RepositoriesController < ApplicationController
  def index
    # @repos = current_user.my_repos
    @repos = GitHubUser.my_repos(current_user)
  end

  def remote
    @repos = current_user.my_repos_elsewhere
  end
end
