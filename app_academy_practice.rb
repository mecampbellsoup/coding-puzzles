def pow base, exponent
  raise 'Params must be non-negative integers' if base < 0
  raise 'Params must be non-negative integers' if exponent < 0
  
  count = 2
  product = base

  if exponent == 1
    return base
  elsif exponent == 0
    return 1
  else
    return base * pow(base, exponent-1)
  end
end

puts pow(2,15)