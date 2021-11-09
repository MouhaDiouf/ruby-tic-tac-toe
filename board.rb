class Board 

    def self.check_winner
      win = check_vertical_win || check_horizontal_win || check_diagonal_win
      if (!win && check_draw == true)
          puts 'draw'
          return 'draw'
      else 
          return win 
      end
    end
    
    def self.check_draw 
      @@grids.flatten.none? {|el| el.is_a?(Integer)}
    end 
  
    def self.check_vertical_win 
      for i in 0...@@grids.length
          if(@@grids[0][i] == @@grids[1][i] && @@grids[1][i] == @@grids[2][i] && !@@grids[0][i].nil? )
              return true
          end 
      end 
      return false
    end 
  
    def self.check_horizontal_win 
      for i in 0...@@grids.length
          if(@@grids[i][0] == @@grids[i][1] && @@grids[i][1] == @@grids[i][2]) 
              return true
          end 
      end 
      return false
    end 
  
    def self.check_diagonal_win
      if(@@grids[0][0] == @@grids[1][1] && @@grids[1][1] == @@grids[2][2] ||
          @@grids[0][2]== @@grids[1][1] && @@grids[1][1] == @@grids[2][0])
      return true
      end
      return false 
    end 
  
    def self.print_board  
         
      @@grids.each_with_index do |row, index|
          puts ' '
          row.each_with_index do |el, inner_idx|
              if (1..9).include?(el)
                  print " #{el} |"
              else
                  print  el == 'X' ? " #{el.to_s.yellow} |"  : " #{el.to_s.green} |" 
              end 
          end 
      end
      2.times {puts  '  '}
    end 
  
  private 
  
  @@grids = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  
  private 
  
    def self.receive_move(side, move)
      count = 1
      for i in 0...3
          for j in  0...3                  
              if count == move 
                  @@grids[i][j] = side
              end 
              count += 1
          end 
      end 
    end 
  
  end 
  