class NickHub
  attr_reader :connection, :access_token

  def initialize
    @connection = Faraday.new(:url => 'https://api.github.com')
  end

  def get_user_info
    stuff = parse(@connection.get '/users/NickyBobby', { 'access_token' => ENV['ACCESS_TOKEN'] })
    # binding.pry
  end

  def get_followers
    parse(@connection.get '/user/followers', { 'access_token' => ENV['ACCESS_TOKEN'] })
  end

  def get_starred_repos
    parse(@connection.get '/user/starred', { 'access_token' => ENV['ACCESS_TOKEN'] })
  end

  def get_following
    parse(@connection.get '/user/following', { 'access_token' => ENV['ACCESS_TOKEN']})
  end

  def get_notifications
    parse(@connection.get '/notifications', { 'access_token' => ENV['ACCESS_TOKEN']})
  end

  def get_repositories
    parse(@connection.get '/users/NickyBobby/repos', { 'access_token' => ENV['ACCESS_TOKEN']})
  end

  def get_organizations
    parse(@connection.get '/users/NickyBobby/orgs', { 'access_token' => ENV['ACCESS_TOKEN']})
  end

  def get_recent_activity
    parse(@connection.get '')
  end

  private

    def parse(response)
      JSON.parse(response.body, object_class: OpenStruct)
    end

end

# nh = NickHub.new
# p nh.followers_count
