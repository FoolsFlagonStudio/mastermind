require_relative "game_colors"
require_relative "player"
require_relative "comp_player"

class Game

    def initialize
        @turns_remaining = 12
        generate_player()
    end

    def generate_player
        puts "What is your name"
        begin
        n = gets.chomp

        puts "Would you like to be the game maker or game breaker; [m / b]"
        
        choice = gets.chomp.downcase

        @player = Player.new(n, choice)

        rescue ArgumentError => e
            puts "Bad argument: #{e.message}"
            retry
        end

    end

    def generate_code
        numbers = 4.times.map { rand(0..ColorList::COLORS.length) }
        color_map = ColorList::COLORS.keys
        @code = ""
        numbers.each do |num|
            code += color_map[num]
        end
        return @code
    end

    def rate_guess

    end

    def play_game

    end


end