require 'rails_helper'

RSpec.describe User, type: :model do
  it 'takes the datafrom the request and puts it in the user model' do
    VCR.use_cassette('Create user model') do
      user = User.from_omniauth(stub_omniauth)
      expect(user.avatar_url).to eq("https://avatar.com")
      expect(user.uid).to eq("8398525")
      expect(user.name).to eq("Matt D")
      expect(user.login).to eq("MDes41")
      expect(user.email).to eq("MDes41@users.noreply.github.com")
      expect(user.oauth_token).to eq("12345")
      expect(user.oauth_token_secret).to eq("6789")
    end
  end
end
