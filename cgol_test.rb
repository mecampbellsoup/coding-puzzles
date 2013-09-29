require 'awesome_print'

def generate(world_size)
  world = []
  world_size.times do
    row = []
    world_size.times do
      row << rand(0..1)
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

def test_changing_cell(size)
  world = generate(size)
  new_world = []
  ap world
  ap living_cell_counter(world)
  world.each_with_index do |row, i|
    new_row = []
    row.each_with_index do |cell, i|
      cell = 0 if cell == 1
      new_row << cell
    end
    new_world << new_row
  end
  ap new_world
  ap living_cell_counter(new_world)
end

test_changing_cell(20)