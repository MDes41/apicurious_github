require 'rails_helper'


describe "Repos" do
  #
  # def create_repos
  #   # first, set OmniAuth to run in test mode
  #   OmniAuth.config.test_mode = true
  #   # then, provide a set of fake oauth data that
  #   # omniauth will use when a user tries to authenticate:
  #   OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
  #     'credentials' => {
  #                       'token' => '12345',
  #                       'secret' => '6789'
  #                     },
  #     'extra' => {
  #         'raw_info' => {
  #                       'avatar_url' => "https://avatar.com",
  #                       'email' => "MDes41@users.noreply.github.com",
  #                       'login' => "MDes41",
  #                       'name' => "Matt D"
  #                       }
  #                 },
  #     'uid' => "5555"})
  # end
  # def create_repos
  #   stubs = Faraday::Adapter::Test::Stubs.new do |stub|
  #     stub.get('https://api.github.com/user/repos') { |env| [200, {}, repo] }
  #   end
  # end
  #
  # def repo
  #   {
  #     "id": 69916301,
  #     "name": "rails_engine",
  #     "full_name": "Cdunagan05/rails_engine",
  #     "owner": {
  #       "login": "Cdunagan05",
  #       "id": 17072308,
  #       "avatar_url": "https://avatars.githubusercontent.com/u/17072308?v=3",
  #     },
  #     "url": "https://api.github.com/repos/Cdunagan05/rails_engine",
  #     "contributors_url": "https://api.github.com/repos/Cdunagan05/rails_engine/contributors",
  #     "commits_url": "https://api.github.com/repos/Cdunagan05/rails_engine/commits{/sha}",
  #     "pushed_at": "2016-10-07T14:22:30Z",
  #     "git_url": "git://github.com/Cdunagan05/rails_engine.git",
  #     "ssh_url": "git@github.com:Cdunagan05/rails_engine.git",
  #     "size": 635
  #   }
  # end
  #
  # before(:each) do
  #   create_repos
  # end

  it "filters by repos" do
    VCR.use_cassette("repos by page") do
      user = create(:user_with_token)
      user_git_services = GitHubService.new(user)
      repos = user_git_services.repos
      repo = repos.first
      expect(repos.count).to eq(30)
      expect(repo[:name]).to eq('rails_engine')
      expect(repo[:html_url]).to eq("https://github.com/Cdunagan05/rails_engine")
    end
  end
end
