class RepositoriesController < ApplicationController
  def index
    @repos = current_user.my_repos
  end

  def remote
    @repos = current_user.my_repos_elsewhere
  end
end
