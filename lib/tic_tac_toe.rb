class TicTacToe
    attr_accessor :board, :count


    WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    def initialize
        @board = [" "," "," "," "," "," "," "," "," " ]
        @count = 0
    end

    def display_board 
        puts board.slice(0,3).split(" |").join("")
        puts board.slice(3,3).split(" |").join("")
        puts board.slice(6,3).split(" |").join("")
    end

    def play 
        until self.over? 
            self.turn 
        end
        if self.winner? 
            puts "#{self.winner} wins!"
        else
            puts "Draw!"
        end
    end

    def turn
        player = self.current_player
        puts "#{player}, make your move!"
        input = gets.chomp
        self.move(input, player)
    end

    def move(input, token = "X")
        index = input_to_index(input)
        if valid_move?(index)
            @board[index] = token
            count ++ 
            self.display_board
        else 
            puts "Spot taken, try again"
            self.turn 
        end
    end

    def won?
        check_val = false
        winning_player = nil 
        check = WIN_COMBINATIONS.each |combo|
            if self.board[combo][0] == self.board[combo][1] && self.board[combo][1] == self.board[combo][2] && self.board[combo][0] != " "
                winning_player = self.board[combo][0]
                check_val = true
            end
        check_val
    end

    def full?
        if self.board.includes(" ")
            false
        else
            true
        end
    end

    def draw? 
        if self.full? && !self.won?
            true
        else
            false
        end 
    end

    def over? 
        if self.won? || self.draw? 
            true
        else
            false
        end
    end

    def winner
        winning_player
    end

        

    def valid_move?(index)
        if index > 0 && index < 9 && !postition_taken?(index)
            true
        else
            false
        end 
    end

    def postition_taken?(index)
        if @board[index] == "X" || @board[index] == "0"
            true
        else 
            false
        end
    end

    def input_to_index(input)
        input - 1 
    end

    def current_player
        if self.count % 0 == 0
            "X"
        else
            "O"
        end
    end

end


