class CreateGametypes < ActiveRecord::Migration
  def change
    create_table :gametypes do |t|
		t.string "name", :limit => 50, :null => false
      t.timestamps
    end
  end
end
