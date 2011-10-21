class CreateGamestates < ActiveRecord::Migration
  def change
    create_table :gamestates do |t|

      t.timestamps
    end
  end
end
