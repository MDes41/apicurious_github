class RepositoriesController < ApplicationController
  def index
    @repos = current_user.my_repos
  end
end
