class CreateSteamUsers < ActiveRecord::Migration
  def change
    create_table :steam_users do |t|
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
