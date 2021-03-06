class TicTacToe

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8],
  ]

def initialize()
  @board= Array.new(9, " ")
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i-1
end 


def move(index, token="x")
  @board[index] = token
end

def position_taken?(index)
   @board[index] =="X" || @board[index] == "O"
end

def valid_move?(position)
  position.between?(0,8) && !position_taken?(position)
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Enter a move by selecting a number 1 through 9"
  user_input = gets
  user_index= input_to_index(user_input)
  if valid_move?(user_index) == true
    move(user_index, current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.detect do |winner|
    @board[winner [0]] == @board[winner[1]] && 
    @board[winner[1]] == @board[winner[2]] &&
    (@board[winner[0]] == "X" || @board[winner[0]] == "O")
  end
end

def full?
  @board.all? {|spot| spot == "X"|| spot == "O"}
end

def draw?
full? && !won?
end

def over?
 won? || draw?
end

def winner
   if winning_combo = won?
   @board[winning_combo.first]
  end
end

  
def play
  turn until over?
  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat's Game!"
  end
end

end