# Mastermind

A command line version of the code-breaking game Mastermind. One side makes a secret 4-color code, and the other side has 12 turns to guess it. After each guess, the breaker is told how many colors are in the correct spot and how many are the right color but in the wrong spot. Duplicate colors are allowed.

You can play as either side:

- **Code breaker:** the computer makes a random secret code and you try to guess it.
- **Code maker:** you make the code and the computer, Han-Tyumi The Confused Cyborg, tries to crack it.

Built as part of [The Odin Project](https://www.theodinproject.com/) Ruby curriculum.

## Assignment

[Mastermind - The Odin Project](https://www.theodinproject.com/lessons/ruby-mastermind)

## Usage

Install dependencies, then run the game:

```bash
bundle install
ruby main.rb
```

Codes and guesses use one letter per color:

| Letter | Color   |
| ------ | ------- |
| r      | red     |
| g      | green   |
| b      | blue    |
| y      | yellow  |
| m      | magenta |
| w      | white   |

Example:

```
Please submit a 4 character guess using any combination of the following: rgbymw
rrgb
You have 1 spots correct, 2 misplaced
```

## How the Computer Guesses

The computer starts with a list of every possible code (6 colors across 4 spots = 1,296 codes) and opens with a two-pair guess. After each round of feedback, it removes every code that couldn't be the secret: if a code would not have produced the same feedback for its last guess, it's eliminated. Its next guess is picked from the codes that are left, which usually narrows things down to the answer within a handful of turns.

## Project Structure

```
mastermind/
├── main.rb              # Starts the game
├── Gemfile              # Project dependencies (colorize)
└── lib/
    ├── game.rb          # Sets up roles, runs the turn loop and scores guesses
    ├── player.rb        # Human player: enters a code or makes guesses from input
    ├── comp_player.rb   # Computer player: generates a random code or guesses by elimination
    └── game_colors.rb   # Shared color map and helper for printing colored codes
```

## What I Learned

- Splitting classes by player type (human and computer) with matching method names, so Game can ask its maker for a code and its breaker for a guess without checking which kind of player it has
- Duck typing and polymorphism: different classes responding to the same method in their own way
- Using a module with a frozen constant as a shared lookup table, and adding module methods so logic like coloring a code lives in one place
- Using a gem for the first time (colorize) and managing it with a Gemfile
- How ANSI escape codes color terminal output, and why `p` shows them raw while `puts` shows the colors
- Scoring guesses by counting colors with `tally`, taking the smaller count for each color to get total color matches, and subtracting exact matches to get misplaced ones, which handles duplicate colors correctly
- Using `fetch` with a default value for hash keys that might be missing
- Generating every possible code with `repeated_permutation`, and the difference between `permutation`, `combination` and `repeated_permutation`
- Narrowing down possibilities with `select!` by keeping only codes that match the feedback so far
- Returning results as a hash with symbol keys so the values are readable wherever they're used
- The difference between inclusive (`..`) and exclusive (`...`) ranges

## Built With

- Ruby
- [colorize](https://github.com/fazibear/colorize)
