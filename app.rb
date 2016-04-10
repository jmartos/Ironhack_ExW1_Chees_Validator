class Piece
    attr_accessor :x1, :y1, :x2, :y2
    @@moves_array = []
    @@board_array = []

    def initialize (name)
        @name = name
        @x1 = x1
        @y1 = y1
        @x2 = x2
        @y2 = y2
    end

    def load_moves_file
        puts "Select file for movements:\nPress 's' for simple_moves.txt or 'c' for complex_moves.txt"
        answer = gets.chomp
        while answer != "s" && answer != "c" do
            puts "Non valid option! Tray again"
            puts "Select file for movements:\nPress 's' for simple_moves.txt or 'c' for complex_moves.txt"
            answer = gets.chomp
        end
            
        if answer == "s" 
            file = "simple_moves.txt" 
        elsif answer == "c"
            file = "complex_moves.txt"
        end

        file_array = (File.foreach("#{file}").map { |line| line.split(//) })
          file_array.each do |item|
           @@moves_array.push(item)
            end
           @@moves_array.each do |item|
            item.delete_at(2)
            item.delete_at(4)
            end
    end

    def load_board_file
        puts "Select file for board:\nPress 's' for simple_board.txt or 'c' for complex_board.txt"
        answer = gets.chomp
        while answer != "s" && answer != "c" do
            puts "Non valid option! Tray again"
            puts "Select file for movements:\nPress 's' for simple_moves.txt or 'c' for complex_moves.txt"
            answer = gets.chomp
        end
            
        if answer == "s" 
            file = "simple_board.txt" 
        elsif answer == "c"
            file = "complex_board.txt"
        end

        file_array = (File.foreach("#{file}").map { |line| line.split })
          file_array.each do |item|
           @@board_array.push(item)
        end
    end
   
    def move_piece
        puts "+++++#{@name}+++++"
        @@moves_array.each do |item|
            item
            @x1 = item[0]
            @y1 = item[1].to_i
            @x2 = item[2]
            @y2 = item[3].to_i
            move
        end
        puts "----------------------"
    end
    
    def check_pos
        @@moves_array.each do |item|
            item
            @x2 = item[2]
            @y2 = item[3].to_i
            hor = @x2.ord-97
            ver = (@y2-8)*-1
            if @@board_array[hor][ver] == "--"
                puts "In coord #{@x2}#{@y2} you will find an EMPTY SPACE"
                else
                puts "In coord #{@x2}#{@y2} you will have a COLISSION!!!"
            end
        end
    end
    
end

class Rook < Piece
    def move
        if @x1 == @x2 || @y1 == @y2
            puts "Moving from #{@x1}#{@y1} to #{@x2}#{@y2} is LEGAL"
            else
            puts "Moving from #{@x1}#{@y1} to #{@x2}#{@y2} is ILEGAL!!!"
        end
    end
end

class Bishop < Piece
    def move
        z=@y1-@y2
        if (@x1.ord == @x2.ord+z && @y1 == @y2+z) ||
            (@x1.ord == @x2.ord-z && @y1 == @y2-z) ||
            (@x1.ord == @x2.ord+z && @y1 == @y2-z) ||
            (@x1.ord == @x2.ord-z && @y1 == @y2+z)
            puts "Moving from #{@x1}#{@y1} to #{@x2}#{@y2} is LEGAL"
            else
            puts "Moving from #{@x1}#{@y1} to #{@x2}#{@y2} is ILEGAL!!!"
        end
    end
end

class Queen < Piece
    def move
        z=@y1-@y2
        if (@x1 == @x2 || @y1 == @y2) ||
            (@x1.ord == @x2.ord+z && @y1 == @y2+z) ||
            (@x1.ord == @x2.ord-z && @y1 == @y2-z) ||
            (@x1.ord == @x2.ord+z && @y1 == @y2-z) ||
            (@x1.ord == @x2.ord-z && @y1 == @y2+z)
            puts "Moving from #{@x1}#{@y1} to #{@x2}#{@y2} is LEGAL"
            else
            puts "Moving from #{@x1}#{@y1} to #{@x2}#{@y2} is ILEGAL!!!"
        end
    end
end

class King < Piece
    def move
        if (@x1.ord == @x2.ord+1 && @y1 == @y2) ||
            (@x1.ord == @x2.ord-1 && @y1 == @y2) ||
            (@x1.ord == @x2.ord && @y1 == @y2+1) ||
            (@x1.ord == @x2.ord && @y1 == @y2-1)
            puts "Moving from #{@x1}#{@y1} to #{@x2}#{@y2} is LEGAL"
            else
            puts "Moving from #{@x1}#{@y1} to #{@x2}#{@y2} is ILEGAL!!!"
        end
    end
end

class Knight < Piece
    def move
        if  (@x1.ord == @x2.ord+1 && @y1 == @y2+2) ||
            (@x1.ord == @x2.ord+1 && @y1 == @y2-2) ||
            (@x1.ord == @x2.ord-1 && @y1 == @y2+2) ||
            (@x1.ord == @x2.ord-1 && @y1 == @y2-2)
            puts "Moving from #{@x1}#{@y1} to #{@x2}#{@y2} is LEGAL"
            else
            puts "Moving from #{@x1}#{@y1} to #{@x2}#{@y2} is ILEGAL!!!"
        end
    end
end

class Pawn_w < Piece
    def move
        if (@x1.ord == @x2.ord+1 && @y1 == @y2)
            puts "Moving from #{@x1}#{@y1} to #{@x2}#{@y2} is LEGAL"
            else
            puts "Moving from #{@x1}#{@y1} to #{@x2}#{@y2} is ILEGAL!!!"
        end
    end
end

class Pawn_b < Piece
    def move
        if (@x1.ord == @x2.ord-1 && @y1 == @y2)
            puts "Moving from #{@x1}#{@y1} to #{@x2}#{@y2} is LEGAL"
            else
            puts "Moving from #{@x1}#{@y1} to #{@x2}#{@y2} is ILEGAL!!!"
        end
    end
end

game1 = Piece.new ""
game1.load_moves_file
game1.load_board_file

rook1 = Rook.new "ROOK"
rook1.move_piece
bishop1 = Bishop.new "BISHOP"
bishop1.move_piece
queen1 = Queen.new "QUEEN"
queen1.move_piece
king1 = King.new "KING"
king1.move_piece
knight1 = Knight.new "KNIGHT"
knight1.move_piece
pawn1w = Pawn_w.new "PAWN WHITE"
pawn1w.move_piece
pawn1b =Pawn_b.new "PAWN BLACK"
pawn1b.move_piece

puts "+++++++++++++++++++++++++++\n"
puts "==>Checking if final position is empty or not<=="
check_spaces = Piece.new "" 
check_spaces.check_pos 




