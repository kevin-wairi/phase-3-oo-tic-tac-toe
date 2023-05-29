class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def display_board(board =@board)
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end
    def input_to_index(user_input)
        user_input.to_i - 1
    end
    def move(index,players_token = 'X')
       @board[index] = players_token
    #    @board[4] ='O'
    end
    def position_taken?(board = @board,index)
        if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
            return false 
        else
            return true
        end
    end
    def valid_move?(index,board = @board)
        if index.between?(0,8) && !position_taken?(board=@board,index)
            return true
        end
    end
    def turn_count(board = @board)
        counter = 0
   board.each do |spaces|
      if spaces == "X" || spaces == "O"
         counter += 1
            end
        end
         counter
    end
    def current_player(board = @board)
        turn_count(board) % 2 == 0 ? "X" : "O"
    end
    def turn(board = @board)
         puts "Please enter a number between 1 and 9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
        move(index, current_player)
        display_board
        else
        puts "Invalid move. Please try again."
        turn
        end
    end
    
   def won?(board = @board)
     WIN_COMBINATIONS.find do |win_combination|
      board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X" || board[win_combination[0]] == "O" &&  board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
    end


    end
    
    def full?(board = @board)
        board.all? {|i| i == "X" || i == "O"}
    end

    def draw?(board = @board)
        if !won?(board) && full?(board)
            return true
        elsif !won?(board) && !full?(board)
            return false
        else won?(board)
            return false
        end
    end
    def over?(board = @board)
        if draw?(board) || won?(board) || full?(board)
            return true
        end
    end
    def winner(board = @board)
        if won?(board)
            return board[won?(board)[0]]
        end
    end
    def play(board = @board)
         until over?(board) 
      turn(board)
   end 
   if won?(board)
      winner(board) == "X" || winner(board) == "O" 
      puts "Congratulations #{winner(board)}!" 
   elsif draw?(board)
      puts "Cat's Game!"
   end
    end

end