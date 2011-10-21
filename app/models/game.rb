class Game < ActiveRecord::Base
	belongs_to :coordinator
	belongs_to :gametype
	has_many :game_players

  accepts_nested_attributes_for :game_players, :allow_destroy => true
	
	validates_presence_of :game_name
end
