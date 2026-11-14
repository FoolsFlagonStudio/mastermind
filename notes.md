### Plan 

game needs 
- randomly select string of secret colors
- track turn count 12 turns
- know whos playing whether player or comp
- return feed back on guess
- ability to input player on what code is

comp player needs
- to make guess with strategy to try to reach win
- track which ones were exact and keep them there, if anything is in the solution
    but not in the right spot keep in answer just in new position switch its spot

player needs
- player name
- make guess

we will use colorize to color the text in directions r = red g = green b = blue y = yellow
we give feedback with for instance 2 colors right 1 in wrong spot 1 in right spot, we print message to tell
we take player input like rgby for red green blue yellow
we can store the correct counts for each in a hashmap then check the order of them

Stretch
maybe we can offer easy mode and hard mode that shows what colors are right exactly vs hard which does only text
or difficulty affects amount of squares and color bank