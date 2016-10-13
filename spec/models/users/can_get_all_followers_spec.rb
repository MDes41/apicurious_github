require 'rails_helper'

RSpec.describe 'Authenticated user' do
  it 'can get all the users followers' do
    user = create(:user_with_token)
  end
end
