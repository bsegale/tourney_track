class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
		t.string "game_name", :limit => 50, :null => false
		t.integer "coordinator_id", :null => false
		t.integer "game_type_id", :null => false
		t.boolean "is_handicapped", :null => false
		t.integer "number_of_rounds"
		t.string "join_code", :limit => 40, :null => false
      	t.timestamps
    end
  end
end
