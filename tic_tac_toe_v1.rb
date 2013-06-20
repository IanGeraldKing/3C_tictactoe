require_relative './board_v1'

class TicTacToe

	attr_accessor :board

	PLAYERS_1_MARK = "x"
	PLAYERS_2_MARK = "o"

	def initialize
		@board			= Board.new
		@players_1_turn	= true
	end

	def mark_space(input)
		mark = @players_1_turn ? PLAYERS_1_MARK : PLAYERS_2_MARK
		unless @board[ (input - 1) / 3 , (input - 1) % 3 ].include? PLAYERS_1_MARK || PLAYERS_2_MARK
				@board[ (input - 1) / 3 , (input - 1) % 3 ] = mark
		end
	end

	def end_turn
		@players_1_turn = !@players_1_turn
	end

	def did_mark_win?(mark)
		(@board.rows + @board.columns + @board.diagonals).any? do |line|
			line == mark * 3
		end
	end

	def did_player_win?
		if @players_1_turn
			did_mark_win?(PLAYERS_1_MARK)
		else
			did_mark_win?(PLAYERS_2_MARK)
		end
	end

	def tied?
		@board.flatten.none? { |string| string =~ /\d/ }
	end

	def ask_player_to_play
		if @players_1_turn
			return "\nPlayer 1, it's your turn: "
		else
			return "\nPlayer 2, it's your turn: "
		end
	end

	def draw_board
		@board.draw_board
	end

end