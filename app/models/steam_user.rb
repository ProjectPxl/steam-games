class SteamUser < ActiveRecord::Base
  has_many :giveaways, dependent: :destroy

  def self.create_new_user(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.nickname = auth.info['nickname']
      user.currency = 0
    end
  end

end
