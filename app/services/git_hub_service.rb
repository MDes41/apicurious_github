class GitHubService
  attr_reader :oauth_token

  def initialize(user)
    @oauth_token = user.oauth_token
  end

  def repos(page = 1)
    response = conn(page).get("https://api.github.com/user/repos?")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(page)
    Faraday.new(:url => 'https://api.github.com/user/repos') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:access_token] = @oauth_token
      faraday.params[:page] = page
    end
  end
end
