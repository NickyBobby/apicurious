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

end
