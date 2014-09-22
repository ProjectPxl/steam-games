class AddNicknameToSteamUsers < ActiveRecord::Migration
  def change
    add_column :steam_users, :nickname, :string
  end
end
