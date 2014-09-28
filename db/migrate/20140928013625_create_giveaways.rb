class CreateGiveaways < ActiveRecord::Migration
  def change
    create_table :giveaways do |t|
      t.integer :game_id
      t.string :game_name
      t.string :participants
      t.integer :min_participants
      t.integer :steam_user_id

      t.timestamps
    end
  end
end
