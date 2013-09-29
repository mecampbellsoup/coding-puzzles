# Conway's Game of Life rules:
## If cell is alive then it continues to stay alive if it has 2 or 3 alive neighbors
## If cell is alive then it dies if it has <2 or >3 neighbors
## If cell is dead then it comes back to life only if it has exactly 3 alive neighbors.

def generate(world_size)
  world = []
  world_size.times do
    row = []
    world_size.times do
      row << [0,0,0,1].sample
    end
    world << row
  end
  world
end

def living_cell_counter(world)
  alive_count = 0
  world.each_with_index do |row, i|
    row.each_with_index do |cell, i|
      alive_count += 1 if cell == 1
    end
  end
  alive_count
end

# for a given cell at (x,y), it's neighbors will be:
# (x+1,y+1)
# (x+1,y)
# (x+1,y-1)
# (x,y+1)
# (x,y-1)
# (x-1,y+1)
# (x-1,y)
# (x-1,y-1)
# NOTE: YOU MUST ACCOUNT FOR EDGE-OF-MAP CASES
# (x,y) is analogous to world[y/row][x/column]... so, for example => world[2][3] => third row, fourth column

def neighbors(row,col,world)
  world_index_size = (0..world.size-1)
  neighbors = []
  neighbors << world[row+1][col+1] if world_index_size.include?(row+1) && world_index_size.include?(col+1)
  neighbors << world[row+1][col] if world_index_size.include?(row+1) && world_index_size.include?(col)
  neighbors << world[row+1][col-1] if world_index_size.include?(row+1) && world_index_size.include?(col-1)
  neighbors << world[row][col+1] if world_index_size.include?(row) && world_index_size.include?(col+1)
  neighbors << world[row][col-1] if world_index_size.include?(row) && world_index_size.include?(col-1)
  neighbors << world[row-1][col+1] if world_index_size.include?(row-1) && world_index_size.include?(col+1)
  neighbors << world[row-1][col] if world_index_size.include?(row-1) && world_index_size.include?(col)
  neighbors << world[row-1][col-1] if world_index_size.include?(row-1) && world_index_size.include?(col-1)
  neighbors.each_with_index do |n,i|
    neighbors.delete(n) if n == 0
  end
  neighbors
end

def run_generation_of_life(world)
  new_world = []
  world.each_with_index do |row, row_index|
    new_world_row = []
    row.each_with_index do |cell, column_index|
      if cell == 1
        if neighbors(row_index, column_index, world).size > 3 || neighbors(row_index, column_index, world).size < 2
          cell = 0
          new_world_row << cell
        elsif [2,3].include? neighbors(row_index,column_index,world).size
          cell = 1
          new_world_row << cell
        end
      elsif cell == 0  # if cell is dead...
        if neighbors(row_index,column_index,world).size == 3
          cell = 1
          new_world_row << cell
        else
          cell = 0
          new_world_row << cell
        end
      end
    end
    new_world << new_world_row
  end
  new_world
end

def game_of_life(grid_size)
  world = generate(grid_size)
  puts "Seed generation zero".center(60, "*")
  generation_count = 0
  loop do
    alive_count = living_cell_counter(world)
    world = run_generation_of_life(world)
    new_alive_count = living_cell_counter(world)
    pp world
    puts ""
    puts "Generation no. #{generation_count}".center(60, "*")
    puts ""
    generation_count += 1
    break if (new_alive_count - alive_count == 0)
  end
end

game_of_life(20)
