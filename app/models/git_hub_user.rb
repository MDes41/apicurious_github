class GitHubUser

  @@AllUsers = Array.new
  attr_reader :login, :name, :avatar_url, :company, :location, :uid, :email

  def initialize(user)
    @login = user[:login]
    user_info = GitHubService.user_info(@login)
    @name = user_info[:name]
    @email = user_info[:email]
    @avatar_url = user_info[:avatar_url]
    @company = user_info[:company]
    @location = user_info[:location]
    @uid = user_info[:id].to_s
    @@AllUsers << self
  end

  def self.all_instances
    @@AllUsers
  end



  def self.find(uid)
    @@AllUsers.select do |instance|
      instance.uid == uid
    end
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
    repos.map { |repo| Repo.new(repo) }
  end

  def self.my_repos(user)
    GitHubService.generic_user_repos(user, page = 1).map do |raw_repo|
      Repo.new(raw_repo)
    end
  end
end
