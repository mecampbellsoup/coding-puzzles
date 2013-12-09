class Path

  @@explored_paths = []

  def initialize(array_of_row_hashes)
    # how to initialize a Path object with knowledge of where it's been?
    @@explored_paths << self
  end

  def next_step(value)
    # starting from the bottom, need to sort of replicate depth-first search...
    # keep track of a path taken by using the keys associated with each value
    # this method should start 2 new paths 
  end

end

class PathHistory
  # maybe use another class to keep track of where it's been
end