class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.login              = auth_info.extra.raw_info.login
      new_user.avatar_url         = auth_info.extra.raw_info.avatar_url
      new_user.email              = auth_info.extra.raw_info.email
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end

  def all_repos
    user_git_services ||= GitHubService.new(self)
    page = 1
    one_page = ['no data']
    repos = []
    until one_page.count == 0
      one_page = user_git_services.repos(page)
      repos += one_page
      page += 1
    end
    repos
  end

  def my_repos
    repos = all_repos
    repos.map do |repo|
      repo if repo[:owner][:id].to_s == uid
    end.compact
  end

  def my_repos_elsewhere
    repos = all_repos
    repos.map do |repo|
      repo if repo[:owner][:id].to_s != uid
    end.compact
  end
end
