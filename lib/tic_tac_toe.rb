class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, token)
      @board[index.to_i-1] = token
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] ==  "" || @board[index] == nil
    false
  else @board[index] == "X" || @board[index] == "0"
    true
    end
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
  end

  def turn
    display_board
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
     move(input, current_player)
     display_board
   else
     turn
  end
end

  def turn_count
    counter = 0
    @board.each do |token|
      if token == "X" || token == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.all? do |token|
      token == "X" || token == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combination = won?
      @board[winning_combination.first]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
