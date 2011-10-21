class CoordinatorPlayers < ActiveRecord::Migration
  def up
  	
  	create_table :players do |t|
  		t.integer "coordinator_id", :null => false
		t.string "name", :limit => 75, :null => false
		t.decimal "index", :precision=> 6, :scale => 2
      	t.timestamps
  end
 end

  def down
  end
end
