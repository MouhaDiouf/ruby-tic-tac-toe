class Game 
    attr_reader :game_over, :moves
    attr_accessor :current_player, :player_one, :player_two
    
    def initialize
        @game_over = false
        @current_player = nil
        @player_one = nil
        @player_two = nil 
        @moves = []
    end 

    def choose_side
        puts "Welcome to the tic-tac-toe! 🕹".green
        puts "Player 1, choose a side (X or Y)".blue
        player_one_side = gets.chomp.upcase
        while (player_one_side.upcase != 'X' && player_one_side.upcase != 'Y')
            puts "Plase choose between X or Y"
            player_one_side = gets.chomp.upcase
            puts 'player side is'
            puts player_one_side
            
        end
        puts "Great choice! Your choice is #{player_one_side.green}"
        player_two_side = player_one_side == 'X' ? 'Y' : 'X'
        @player_one = Player.new(player_one_side)
        @current_player = player_one
        player_two_side = player_one_side == 'X' ? 'Y' : 'X'
        @player_two = Player.new(player_two_side)
        sleep 1
        puts "Player 2, your side is #{player_two_side.yellow}"
        sleep 1
        puts "Here's the board: "
  
    end 

    def switch_players
        if !game_over
            puts "#{current_player.side} it's your turn, choose a position from 1 to 9  "
            move = gets.chomp.to_i
            while !(1..9).include?(move)
                puts ('Please choose between 1 and 9 😊'.red.bold)
                move = gets.chomp.to_i
            end 
        
            while(@moves.include?(move))
                puts "Wrong move :( . Already taken. Choose between 1 and 9"
                move = gets.chomp.to_i
            end 
            current_player.play(move)
            Board.print_board
            @game_over =  Board.check_winner
            moves << move 
            @current_player = @current_player == @player_one ? @player_two : @player_one
            switch_players
        elsif @game_over == 'draw' 
            puts "Game over, it's a draw!".red.bold

        elsif @game_over == true
            @current_player = @current_player == @player_one ? @player_two : @player_one
            puts "Game over #{current_player.side} wins!".blue.bold
        end 
    end 

  

    def start
        choose_side
        Board.print_board
        switch_players
    end 

end 
