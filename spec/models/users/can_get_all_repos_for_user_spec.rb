require 'rails_helper'

RSpec.describe 'Authenticated user' do
  it 'can get all the repos for that user' do
    VCR.use_cassette('user.all_repos') do
      user = create(:user_with_token)
      repos = user.all_repos
      expect(repos.count).to eq(65)
      expect(repos.first[:name]).to eq('rails_engine')
      expect(repos.last[:name]).to eq('http_yeah')
    end
  end

  it 'can get just repos owned by user' do
    VCR.use_cassette('user.my_repos') do
      user = create(:user_with_token)
      repos = user.my_repos
      expect(repos.count).to eq(54)
      expect(repos.first[:name]).to eq('1module_homework_flow_control')
      expect(repos.last[:name]).to eq('WP_Repository_Port')
    end
  end

  it 'can get repos owned by someone else' do
    VCR.use_cassette('user.my_repos_elsewhere') do
      user = create(:user_with_token)
      repos = user.my_repos_elsewhere
      expect(repos.count).to eq(11)
      expect(repos.first[:name]).to eq('rails_engine')
      expect(repos.last[:name]).to eq('http_yeah')
    end
  end
end
