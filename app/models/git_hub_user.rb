class GitHubUser
  attr_reader :login, :name, :avatar_url, :company, :location, :uid

  def initialize(user)
    @login = user[:login]
    user_info = GitHubService.user_info(@login)
    @name = user_info[:name]
    @avatar_url = user_info[:avatar_url]
    @company = user_info[:company]
    @location = user_info[:location]
    @uid = user_info[:id]
  end

  def all_repos
    page = 1
    one_page = ['no data']
    repos = []
    until one_page.count == 0
      one_page = GitHubService.generic_user_repos(self, page)
      repos += one_page
      page += 1
    end
    s = repos.map { |repo| Repo.new(repo) }
  end
end
