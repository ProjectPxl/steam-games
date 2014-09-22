class SteamUser < ActiveRecord::Base

  def self.create_new_user(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.nickname = auth.info['nickname']
      user.currency = 0
    end
  end

end
