class AddCurrencyToSteamUsers < ActiveRecord::Migration
  def change
    add_column :steam_users, :currency, :integer
  end
end
