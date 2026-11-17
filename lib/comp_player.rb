class Computer
  def initialize(r)
    @name = "Han-Tyumi The Confused Cyborg"
    @role = r
    @possible_codes = ColorList::COLORS.keys.repeated_permutation(4).map { |code| code.join }
    @previous_guess = nil
  end

  def make_puzzle
    numbers = 4.times.map { rand(0...ColorList::COLORS.length) }
    color_map = ColorList::COLORS.keys
    puzzle = ""
    numbers.each do |num|
      puzzle += color_map[num]
    end
    return puzzle
  end

  def make_guess(rating)
    if rating.nil? || @previous_guess.nil?
      colors = ColorList::COLORS.keys
      @previous_guess = "#{colors[0]}#{colors[0]}#{colors[1]}#{colors[1]}"
    else
      @possible_codes.select! do |candidate|
        evaluate_guess(candidate, @previous_guess) == rating
      end

      @previous_guess = @possible_codes.sample || @possible_codes.first
    end

    return @previous_guess
  end

  private

  def evaluate_guess(secret, guess)
    right_spots = 0
    color_matches = 0
    guess_counts = guess.chars.tally
    secret_counts = secret.chars.tally

    secret_counts.each_key do |key|
      color_matches += [secret_counts.fetch(key, 0), guess_counts.fetch(key, 0)].min
    end

    secret.chars.zip(guess.chars).each do |(secret_char, guess_char)|
      if secret_char == guess_char
        right_spots += 1
      end
    end

    { correct: right_spots, misplaced: color_matches - right_spots }
  end
end