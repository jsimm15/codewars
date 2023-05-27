def is_square(x)
  puts "start #{x}"
  if (x < 0)
    return false
  elsif (x == 0)
    return true
  else
    half = (x/2)+1
    puts half
    num_range = (1..half).map { |num| num*num }
    print num_range
    return false unless num_range.include?(x)
    return true
  end
end

puts is_square(0)
puts is_square(-1)
puts is_square(1)
puts is_square(3)
puts is_square(4)
puts is_square(5)
puts is_square(25)
puts is_square(51)
puts is_square(100)
