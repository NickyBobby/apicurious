require 'rails_helper'

describe NickHub do
  context "user can log in" do
    it "logged in user sees user show page" do
      VCR.use_cassette("nick_hub#user_info") do
        # visit root_path
        # click_on "Sign in with Github"
        # save_and_open_page
      end
    end
  end
end
