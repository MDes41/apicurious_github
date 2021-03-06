FactoryGirl.define do
  factory :user do
    uid                  "8398525"
    name                 "Matt D"
    login                "MDes41"
    avatar_url           "https://avatar.com"
    email                "MDes41@users.noreply.github.com"
    repos_url            "https://api.github.com/users/MDes41/repos"
    oauth_token          "12345"
    oauth_token_secret   "6789"

    factory :user_with_token do
      uid                  "8398525"
      name                 "Matt D"
      login                "MDes41"
      avatar_url           "https://avatar.com"
      email                "MDes41@users.noreply.github.com"
      repos_url            "https://api.github.com/users/MDes41/repos"
      oauth_token          ENV['GITHUB_TOKEN']
      oauth_token_secret   "6789"
    end
  end
end
