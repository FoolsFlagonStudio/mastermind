require_relative "game_colors"
require_relative "player"
require_relative "comp_player"

class Game

    def initialize
        @turns_remaining = 12
        setup_players()
        set_up_game()
        @in_progress = true
    end

    def set_up_game
        begin
        @code = @master.make_puzzle
        rescue ArgumentError => e
            puts "Bad argument: #{e.message}"
            retry
        end

        @code_counts = @code.chars.tally
    end

    def setup_players
        puts "What is your name"
        begin
        n = gets.chomp

        puts "Would you like to be the game maker or game breaker; [m / b]"
        
        choice = gets.chomp.downcase
        if choice == "m"
            @master = Player.new(n, choice)
            @breaker = Computer.new("breaker")
        else
            @master = Computer.new("master")
            @breaker = Player.new(n, "breaker")
        end

        rescue ArgumentError => e
            puts "Bad argument: #{e.message}"
            retry
        
        end
    end

    def rate_guess(guess)
        right_spots = 0
        color_matches = 0
        guess_counts = guess.chars.tally

        @code_counts.each_key do |key|
            color_matches += [@code_counts.fetch(key), guess_counts.fetch(key, 0)].min
        end

        @code.chars.zip(guess.chars).each do |(code_char, guess_char)|
            if code_char == guess_char
                right_spots += 1
            end
        end

        return {correct: right_spots, misplaced: color_matches - right_spots}
    end

    def check_win(correct_spots)
        if correct_spots == @code.length
            puts "Congratulations #{player.name}! You win"
            @in_progress = false
        end
    end

    def give_feedback(rating)
        puts "You have #{rating[:correct]} spots correct, #{rating[:misplaced]} misplaced"
    end

    def play_game
        rating = nil 

        while @in_progress && @turns_remaining > 0
            guess = @breaker.make_guess(rating)
            
            rating = rate_guess(guess)
            
            give_feedback(rating)
            @turns_remaining -= 1 
            
            if check_win(rating)
                @in_progress = false
                break
            end
        end
    end


end