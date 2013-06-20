class Board

	GAP = " "

	def initialize
		@board = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
	end

	### Architecting the Board ###

	def rows
		rows = []
		@board.each do |row|
		rows <<row.join
	end
	return rows
	end

	def columns
		columns = []
		for i in 0..2
			column = ""
			@board.each do |row|
			column += row[i]
		end
		columns << column
	end
	return columns
	end

	def diagonals
		[[0,1,2], [2,1,0]].map do |columns|
			columns.each_with_index.map {|column, row| @board[row][column] }.join
		end
	end

	def [](row, column)
		@board[row][column]
	end

	def []=(row, column, mark)
		@board[row][column] = mark
	end

	### Drawing the Board ###

	def draw_row(row)
		GAP + row.join(' | ') + "\n"
	end

	def draw_line
		"#{GAP}---------\n"
	end

	def draw_board
		"\n" + @board.map { |row| draw_row(row) }.join(draw_line)
	end

	def flatten
		@board.flatten
	end

end
