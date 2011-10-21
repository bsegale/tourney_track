class AlterCoordinators < ActiveRecord::Migration
  def up
  	rename_column("coordinators", "password", "hashed_password")
  	add_column("coordinators", "salt", :string, :limit => 40)
  end

  def down
  end
end
