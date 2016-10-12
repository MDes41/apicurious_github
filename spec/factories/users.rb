FactoryGirl.define do
  factory :user do
    uid                  "5555"
    name                 "Matt D"
    login                "MDes41"
    avatar_url           "https://avatar.com"
    email                "MDes41@users.noreply.github.com"
    oauth_token          ENV['GITHUB_TOKEN']
    oauth_token_secret   "6789"
  end
end
