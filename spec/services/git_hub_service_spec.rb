require 'rails_helper'


describe "Repos" do
  it "filters by repos" do
    VCR.use_cassette("first page of repos") do
      user = create(:user_with_token)
      repos = GitHubService.authenticated_user_repos(user)
      repo = repos.first
      expect(repos.count).to eq(30)
      expect(repo[:name]).to eq('rails_engine')
      expect(repo[:html_url]).to eq("https://github.com/Cdunagan05/rails_engine")
    end
  end
end
