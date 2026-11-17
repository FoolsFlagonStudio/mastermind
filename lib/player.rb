require_relative "game_colors"

class Player

    attr_reader  :name, :role

    def initialize(n, r)
        if n.strip! == ""
            raise ArgumentError, "Please provide a name"
        end
        @name = n
        @role = r
    end

    def make_puzzle
        puts "Please submit a 4 character code using any combination of the following: #{ColorList.print_colors}"
        
        puzzle = gets.chomp

        if puzzle.length != 4
            raise ArgumentError, "Your puzzle must be exactly 4 characters"
        elsif puzzle.each_char.any? { |c| !ColorList::COLORS.key?(c) }
            raise ArgumentError, "You may only use the colors in this list: #{ColorList.print_colors}"
        end

        return puzzle

    end

    def make_guess(rating)
        puts "Please submit a 4 character guess using any combination of the following: #{ColorList.print_colors}"
        
        guess = gets.chomp
        
        if guess.length != 4
            raise ArgumentError, "Your guess must be exactly 4 characters"
        elsif guess.each_char.any? { |c| !ColorList::COLORS.key?(c) }
            raise ArgumentError, "You may only use the colors in this list: #{ColorList.print_colors}"
        end

        return guess
    end

end