require 'colorize'

module ColorList
    attr_reader :COLORS
    COLORS = {
        "r"=> :red,
        "g"=> :green,
        "b"=> :blue,
        "y" => :yellow,
        "m" => :magenta,
        "w" => :white
    }.freeze

    def self.print_colors

        color_map = COLORS.map {|key, value| "#{key.colorize(value)}"}
        color_map = color_map.join("")
        return color_map
    end

end