class GithubUser

  def initialize(user)
    @user = user
  end

  def user_info
    NickHub.new.get_user_info(@user)
  end

  def starred_repos
    NickHub.new.get_starred_repos
  end

  def notifications
    NickHub.new.get_notifications
  end

  def repositories
    NickHub.new.get_repositories(@user)
  end

  def organizations
    NickHub.new.get_organizations(@user)
  end

  def recent_activity
    NickHub.new.get_recent_activity
  end

  def current_streak
    NickHub.new.get_current_streak(@user)
  end

  def current_streak_timeframe
    NickHub.new.get_current_streak_timeframe(@user)
  end

  def longest_streak
    NickHub.new.get_longest_streak(@user)
  end

  def longest_streak_timeframe
    NickHub.new.get_longest_streak_timeframe(@user)
  end

  def total_contributions
    NickHub.new.get_total_contributions(@user)
  end

  def total_contributions_timeframe
    NickHub.new.get_total_contributions_timeframe(@user)
  end
end
