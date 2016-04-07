require 'open-uri'

class NickHub
  attr_reader :connection, :access_token

  def initialize
    @connection = Faraday.new(:url => 'https://api.github.com')
  end

  def get_user_info(user)
    stuff = parse(@connection.get "/users/#{user.username}", { 'access_token' => ENV['ACCESS_TOKEN'] })
    # binding.pry
  end

  def get_starred_repos
    parse(@connection.get '/user/starred', { 'access_token' => ENV['ACCESS_TOKEN'] })
  end

  def get_notifications
    parse(@connection.get '/notifications', { 'access_token' => ENV['ACCESS_TOKEN']})
  end

  def get_repositories(user)
    parse(@connection.get "/users/#{user.username}/repos", { 'access_token' => ENV['ACCESS_TOKEN']})
  end

  def get_organizations(user)
    parse(@connection.get "/users/#{user.username}/orgs", { 'access_token' => ENV['ACCESS_TOKEN']})
  end

  def get_recent_activity
    parse(@connection.get '')
  end

  def get_current_streak(user)
    main_page(user).xpath('//*[@id="contributions-calendar"]/div[5]/span[2]').text
  end

  def get_current_streak_timeframe(user)
    main_page(user).xpath('//*[@id="contributions-calendar"]/div[5]/span[3]').text
  end

  def get_longest_streak(user)
    main_page(user).xpath('//*[@id="contributions-calendar"]/div[4]/span[2]').text
  end

  def get_longest_streak_timeframe(user)
    main_page(user).xpath('//*[@id="contributions-calendar"]/div[4]/span[3]').text
  end

  def get_total_contributions(user)
    main_page(user).xpath('//*[@id="contributions-calendar"]/div[3]/span[2]').text
  end

  def get_total_contributions_timeframe(user)
    main_page(user).xpath('//*[@id="contributions-calendar"]/div[3]/span[3]').text
  end

  private

    def parse(response)
      JSON.parse(response.body, object_class: OpenStruct)
    end

    def main_page(user)
      @main_page = Nokogiri::HTML(open("https://github.com/#{user.username}"))
    end

end

# nh = NickHub.new
# p nh.followers_count
