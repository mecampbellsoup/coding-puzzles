require 'pry'

class Fixnum

  # the sqrt method will return the square root of the Fixnum instance
  # first check if self has a perfect square
  # then find the two integers that it's between
  # then start checking your remainder and honing in...

  def sqrt(precision = 6) # where precision should be number of decimal points, e.g. precision of 6 means keep checking until abs(ours-real_root) < 10^-6
    bounds = check_for_perfect_square_or_get_bounds
    if bounds.is_a? Array
      binary_search_for_remainder(bounds.first, precision)
    else
      return bounds
    end
  end

  def check_for_perfect_square_or_get_bounds
    i = 0
    loop do
      i += 1
      return i if i*i == self
      return [i-1, i] if i*i > self
    end
  end

  # I want to follow a sort of binary search pattern, where I divide and conquer as I approach the answer
  # with greater and greater proximity

  def binary_search_for_remainder(lower_bound, precision)
    count = -1
    difference = 1/0.0 # a practical use of ruby's Infinity constant!
    remainder = 2**count # e.g. 0.5 at first
    
    while difference > 10**(-precision)

      if (lower_bound + remainder)**2 > self
        count -= 1
        remainder = remainder - 2**count # so now remainder is 0.5 - 0.25 = 0.25
        # increment count, recalculate remainder and 
        # check the difference again to see if we're done looping
      elsif (lower_bound + remainder)**2 < self
        count -= 1
        remainder = remainder + 2**count # so now remainder is 0.5 - 0.25 = 0.25
      end
      check = (lower_bound + remainder)**2
      difference = (check - self).abs
    end
    return lower_bound + remainder
  end

end

puts "The square root of 40 is #{40.sqrt.to_f}"
puts "The square root of 50 is #{50.sqrt.to_f}"
puts "The square root of 36 is #{36.sqrt.to_f}"
