class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.login              = auth_info.extra.raw_info.login
      new_user.avatar_url         = auth_info.extra.raw_info.avatar_url
      new_user.email              = auth_info.extra.raw_info.email
      new_user.repos_url          = auth_info.extra.raw_info.repos_url
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end

  def all_repos
    page = 1
    one_page = ['no data']
    repos = []
    until one_page.count == 0
      one_page = GitHubService.authenticated_user_repos(self, page)
      repos += one_page
      page += 1
    end
    repos.map { |repo| Repo.new(repo) }
  end

  def my_repos
    repos = all_repos
    repos.map do |repo|
      repo if repo.owner == uid
    end.compact
  end

  def my_repos_elsewhere
    repos = all_repos
    repos.map do |repo|
      repo if repo.owner != uid
    end.compact
  end

  def followers
    @followers ||= GitHubService.followers(self).map do |user|
      GitHubUser.new(user)
    end
    @followers
  end
end
