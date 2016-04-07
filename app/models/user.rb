class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    where(uid: auth[:uid]).first_or_create do |user|
      user.provider = auth["provider"]
      user.uid      = auth["uid"]
      user.name     = auth["info"]["name"]
      user.username = auth["info"]["nickname"]
      user.avatar   = auth["info"]["image"]
      user.token    = auth["credentials"]["token"]
    end
  end

  def user_info
    NickHub.new.get_user_info
  end

  def followers
    NickHub.new.get_followers
  end

  def starred_repos
    NickHub.new.get_starred_repos
  end

  def following
    NickHub.new.get_following
  end

  def notifications
    NickHub.new.get_notifications
  end

  def repositories
    NickHub.new.get_repositories
  end

  def organizations
    NickHub.new.get_organizations
  end

  def recent_activity
    NickHub.new.get_recent_activity
  end
end
