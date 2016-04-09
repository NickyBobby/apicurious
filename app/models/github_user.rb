class GithubUser

  def initialize(user)
    @user = user
  end

  def user_info
    service.get_user_info
  end

  def starred_repos
    service.get_starred_repos
  end

  def repositories
    service.get_repositories
  end

  def organizations
    service.get_organizations
  end

  def current_streak
    service.get_current_streak
  end

  def current_streak_timeframe
    service.get_current_streak_timeframe
  end

  def longest_streak
    service.get_longest_streak
  end

  def longest_streak_timeframe
    service.get_longest_streak_timeframe
  end

  def total_contributions
    service.get_total_contributions
  end

  def total_contributions_timeframe
    service.get_total_contributions_timeframe
  end

  private
    def service
      @service ||= NickHub.new(@user)
    end
end
