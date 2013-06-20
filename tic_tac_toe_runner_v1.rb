require_relative './tic_tac_toe_v1'

game = TicTacToe.new
loop do
	print game.draw_board
	print game.ask_player_to_play
	space_number = gets.to_i
	game.mark_space(space_number)
	if game.tied?
		puts "Nobody one and yet everyone's a winner. You've reached a draw. Stand down and start over."
		break
	elsif game.did_player_win?
		puts "There has been a victor! Sip from the chalice of triumph. Loser, go home and prostrate yourself before false deities."
		break
	end
	game.end_turn			

end