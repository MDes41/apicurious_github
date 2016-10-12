require 'rails_helper'


RSpec.describe 'User logs in with git hub' do
  include Capybara::DSL

  before(:each) do
    Capybara.app = ApicuriousGithub::Application
    stub_omniauth
  end

  it 'allows the user to login' do
      visit "/"
      expect(page.status_code).to eq(200)
      click_link "Login With Git Hub"
      expect(current_path).to eq("/dashboard")

      expect(page).to have_content("Signed in as MDes41")
      expect(page).to have_content("Sign Out")
  end

  it 'allows the user to logout' do
    visit "/"
    expect(page.status_code).to eq(200)
    click_link "Login With Git Hub"
    expect(current_path).to eq("/dashboard")

    expect(page).to have_content("Signed in as MDes41")
    expect(page).to have_content("Sign Out")

    click_link "Sign Out"
    expect(page).to_not have_content("Signed in as MDes41")
  end
end
