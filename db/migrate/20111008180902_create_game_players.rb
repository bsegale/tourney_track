class CreateGamePlayers < ActiveRecord::Migration
  def change
    create_table :game_players do |t|

      t.timestamps
    end
  end
end
