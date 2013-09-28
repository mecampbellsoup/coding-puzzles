require 'awesome_print'
require 'pry'

# If cell is alive then it continues to stay alive if it has
# 2 or 3 alive neighbors.  If the cell is dead then it comes
# back to life only if it has exactly 3 alive neighbors.
# @alive is a Boolean value in each cell that changes through time
# @alive has neighbors, eight to be exact
# if @alive = true, then it becomes false only if the # of neighbors > 3 or < 2 (it remains true if neighbors == 2 || neighbors == 3)
# if @alive = false, then it becomes true only if the # of neighbors == 3

o = false
x = true

world = [
        [o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o], #0
        [o,o,o,o,o,x,o,o,o,o,o,o,o,o,o,o,o], #1
        [o,o,o,o,x,x,x,o,o,o,o,o,o,o,o,o,o], #2
        [o,o,o,o,o,x,o,o,o,o,o,o,o,o,o,o,o], #3
        [o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o], #4
        [o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o], #5
        [o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o], #6
        [o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o], #7
        [o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o], #8
        [o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o], #9
        [o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o], #10
        [o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o], #11
        [o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o], #12
        [o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o], #13
        [o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o], #14
        [o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o], #15
        [o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o]  #16
        ]

# for a given cell at (x,y), it's neighbors will be:
# (x+1,y+1)
# (x+1,y)
# (x+1,y-1)
# (x,y+1)
# (x,y-1)
# (x-1,y+1)
# (x-1,y)
# (x-1,y-1)

# (x,y) is analogous to world[y/row][x/column]... so, for example => world[2][3] => third row, fourth column
def neighbors(row,col,world)
  total_true = []
  [
  world[row+1][col+1], 
  world[row+1][col], 
  world[row+1][col-1], 
  world[row][col+1], 
  world[row][col-1], 
  world[row-1][col+1], 
  world[row-1][col], 
  world[row-1][col-1]
  ].each do |neighbor|
    total_true << neighbor if neighbor == true
  end
  total_true
end

def game_of_life(world)
  world.each_with_index do |row, row_index|
    row.each_with_index do |cell, column_index|
      if cell == true  # if cell is alive...
        if neighbors(row_index, column_index, world).size > 3 || neighbors(row_index, column_index, world).size < 2
          cell = false
        elsif [2,3].include? neighbors(row_index,column_index,world).size
          cell = true
        end
      elsif cell == false  # if cell is dead...
        binding.pry
        cell = true if neighbors(row_index,column_index,world).size == 3
      end
    end
  end
  ap world
end

# def game_of_life_loop
# end

ap neighbors(2,5,world)
ap neighbors(2,5,world).class
game_of_life(world)