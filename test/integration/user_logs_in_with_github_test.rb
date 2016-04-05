require 'test_helper'

class UserLogsInWithGithubTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = Apicurious::Application
    stub_omniauth
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "Sign in with Github"
    assert_equal "/", current_path
    assert page.has_content?("Horace")
    assert page.has_link?("Logout")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    "id": 1,
    "url": "https://api.github.com/authorizations/1",
    "scopes": [
      "public_repo"
    ],
    "token": "",
    "token_last_eight": "12345678",
    "hashed_token": "25f94a2a5c7fbaf499c665bc73d67c1c87e496da8985131633ee0a95819db2e8",
    "app": {
      "url": "http://my-github-app.com",
      "name": "my github app",
      "client_id": "abcde12345fghij67890"
    },
    "note": "optional note",
    "note_url": "http://optional/note/url",
    "updated_at": "2011-09-06T20:39:23Z",
    "created_at": "2011-09-06T17:26:27Z",
    "fingerprint": "jklmnop12345678"
    })
  end
end
