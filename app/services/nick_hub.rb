require 'open-uri'

class NickHub
  attr_reader :connection, :access_token, :user

  def initialize(user)
    @connection = Faraday.new(:url => 'https://api.github.com')
    @user = user
  end

  def get_user_info
    parse(@connection.get "/users/#{user.username}", { 'access_token' => ENV['ACCESS_TOKEN'] })
  end

  def get_starred_repos
    parse(@connection.get '/user/starred', { 'access_token' => ENV['ACCESS_TOKEN'] })
  end

  def get_repositories
    parse(@connection.get "/users/#{user.username}/repos", { 'access_token' => ENV['ACCESS_TOKEN']})
  end

  def get_organizations
    parse(@connection.get "/users/#{user.username}/orgs", { 'access_token' => ENV['ACCESS_TOKEN']})
  end

  def get_current_streak
    main_page.xpath('//*[@id="contributions-calendar"]/div[5]/span[2]').text
  end

  def get_current_streak_timeframe
    main_page.xpath('//*[@id="contributions-calendar"]/div[5]/span[3]').text
  end

  def get_longest_streak
    main_page.xpath('//*[@id="contributions-calendar"]/div[4]/span[2]').text
  end

  def get_longest_streak_timeframe
    main_page.xpath('//*[@id="contributions-calendar"]/div[4]/span[3]').text
  end

  def get_total_contributions
    main_page.xpath('//*[@id="contributions-calendar"]/div[3]/span[2]').text
  end

  def get_total_contributions_timeframe
    main_page.xpath('//*[@id="contributions-calendar"]/div[3]/span[3]').text
  end

  private

    def parse(response)
      JSON.parse(response.body, object_class: OpenStruct)
    end

    def main_page
      @main_page ||= Nokogiri::HTML(open("https://github.com/#{user.username}"))
    end

end

# nh = NickHub.new
# p nh.followers_count
