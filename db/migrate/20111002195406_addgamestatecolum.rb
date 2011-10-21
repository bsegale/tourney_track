class Addgamestatecolum < ActiveRecord::Migration
  def up
  	add_column("games", "gamestate_id", :integer)
  end

  def down
  end
end
