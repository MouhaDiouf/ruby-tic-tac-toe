class Player
    attr_reader :side
    def initialize(side)
        @side = side 
    end 


    def play(move)
        Board.receive_move(side,move)
    end 

end 
