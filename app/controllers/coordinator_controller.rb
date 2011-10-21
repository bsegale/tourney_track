class CoordinatorController < ApplicationController

  #Left_Of_Decimal_Values = ['bar', 'line']
  IS_HANDICAPPED_SELECT_OPTIONS = [['No','0'],['Yes','1']]
  NUMBER_ROUNDS_SELECT_OPTIONS = [['1','1'],['2','2'], ['3','3'], ['4','4']]

	layout 'admin'
	
	def gamelist
		@games = Game.where(:coordinator_id => 1)
	end
	
	def gamedetails
		@game = Game.find(params[:id])
	end
	
	def newgame
		@gametypes = Gametype.all.map {|g| [g.name, g.id] }
		
		# names and values for is handicapped select list
		@is_handicapped_select_values = IS_HANDICAPPED_SELECT_OPTIONS
		# names and values for number of rounds select list
		@number_of_rounds_select_values = NUMBER_ROUNDS_SELECT_OPTIONS
	end
	
	def creategame
		@game = Game.new(params[:game])
		@game.coordinator_id = 1
		@game.gamestate_id = 1 # Set the gamestate to setup
		if @game.save
			flash[:notice] = 'Game created successfully!'
			redirect_to(:action => 'addplayers')
		else
			@gametypes = Gametype.all.map {|g| [g.name, g.id] }
			# names and values for is handicapped select list
			@is_handicapped_select_values = [['No','0'],['Yes','1']]
		
			# names and values for number of rounds select list
			@number_of_rounds_select_values = [['1','1'],['2','2']]
			render('newgame')
		end
	end
	
	def editgame
		@gametypes = Gametype.all.map {|g| [g.name, g.id] }
		@game = Game.find(params[:id])
		
		# names and values for is handicapped select list
		@is_handicapped_select_values = [['No','0'],['Yes','1']]
		
		# names and values for number of rounds select list
		@number_of_rounds_select_values = [['1','1'],['2','2']]
	end
	
	def updategame
		@game = Game.find(params[:id])
		
		# If save succeeds, redirect to the gamelist
		if @game.update_attributes(params[:game])
			flash[:notice] = 'Game created successfully!'
			redirect_to(:action => 'gamelist')
		else
			# If save fails, redisplay the form so the user can fix the problem
			render('newgame')
		end
	end
	
	def deletegame
		@game = Game.find(params[:id])
	end
	
	def destroygame
		@game = Game.find(params[:id])
		@game.destroy
		redirect_to(:action => 'gamelist')
	end
	
	def addplayers

		# @game = Game.find(params[:id])
    @game = Game.find(2)

  end

  def testaddplayers

		# @game = Game.find(params[:id])
    @game = Game.find(2)
    @game_players = @game.game_players

	end
	
	# expects 1 or more players coming in from addplayers form
	def createplayers

		@bad_player_entries = Array.new
		@added_players = Array.new
		@error_count = 0
		
		# Get values from form field parameters
		
		@player_name = params[:Player1Name]
		@player_index = params[:Player1Index]
		@gid = params[:id]

		if !params[:Player1Name].empty?
      process_player(params[:id], params[:Player1Name], params[:Player1Index])
		end
		
		
		if @error_count > 0
      @game = Game.find(2)
			render('addplayers')
    else
			redirect_to(:action => 'gamelist')
		end
			
	end
	
	def fixplayers
		@players_to_repair = @bad_player_entries
		@total_error_count = 1
	end
	
	private
	def process_player(gid, player_name, player_index)
		@player = GamePlayer.new(:game_id => gid, :name => player_name, :player_index => player_index.to_f)

    if @player.save
			@added_players << @player
		else
			@bad_player_entries << @player
			@error_count += 1
		end
	end
end
