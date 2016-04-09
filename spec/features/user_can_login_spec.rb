require 'rails_helper'

RSpec.feature "user can log in" do
  context "user can log in" do
    scenario "logged in user sees user show page" do
      VCR.use_cassette("nick_hub#user_info") do
        stub_omniauth
        visit "/"
        click_on "Sign in with Github"
        expect(page).to have_content("Denver, CO")
        expect(page).to have_content("Joined on Aug 18, 2015")
        expect(page).to have_content("apicurious")
        expect(page).to have_content("nickybobby.github.io")
      end
    end

    scenario "logged out user sees sign page" do
      VCR.use_cassette("nick_hub#user_info") do
        stub_omniauth
        visit "/"
        click_on "Sign in with Github"
        click_on "Logout"
        expect(page).to have_content("Sign in with Github")
        expect(page).not_to have_content("Logout")
      end
    end

  end
end
