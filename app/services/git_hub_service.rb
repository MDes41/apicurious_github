class GitHubService

  def self.authenticated_user_repos(user, page = 1)
    response = conn.get do |req|
      req.url "/user/repos"
      req.params[:page] = page
      req.params[:access_token] = user.oauth_token
    end
    parse(response)
  end

  def self.generic_user_repos(user, page = 1)
    response = conn.get do |req|
      req.url "/users/#{user.login}repos"
      req.params[:page] = page
    end
    parse(response)
  end

  def self.followers(login)
    response = conn.get do |req|
      req.url "/users/#{login}/followers"
      req.params[:access_token] = ENV["GITHUB_TOKEN"]
    end
    parse(response)
  end

  def self.user_info(login)
    response = conn.get do |req|
      req.url "/users/#{login}"
    end
    parse(response)
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(:url => 'https://api.github.com', :request => { :params_encoder => Faraday::FlatParamsEncoder }) do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
