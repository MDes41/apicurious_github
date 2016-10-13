class GitHubUser
  def initialize(user)
    @login = user[:login]
    user_info = GitHubService.user_info(@login)
    @name = user_info[:name]
    @avatar_url = user_info[:avatar_url]
    @company = user_info[:company]
    @location = user_info[:location]
    @repo_url = user_info[:repos_url]
    @followers = user_info[:followers_url]
  end
end
