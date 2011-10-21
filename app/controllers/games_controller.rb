class GamesController < ApplicationController
	
	def list
		@games = Game.order("games.created_at ASC")
	end
	
	def show
		@game = Game.find(params[:id])
	end
end
