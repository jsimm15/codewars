=begin 
In this little assignment you are given a string of space separated numbers, and have to return the highest and lowest number.

Examples
high_and_low("1 2 3 4 5")  # return "5 1"
high_and_low("1 2 -3 4 5") # return "5 -3"
high_and_low("1 9 3 4 -5") # return "9 -5"
Notes
All numbers are valid Int32, no need to validate them.
There will always be at least one number in the input string.
Output string must be two numbers separated by a single space, and highest number is first.
=end

def high_and_low(numbers)
  #Grab input string
  nums = numbers
  #Starting values for current, high, low
  current = ""
  high, low = nil
  nums.each_char do |c|
    if c == " " #When space is reached compare current to existing high and low values. Nil? check ensures that high and low will be set to first number in series
      if (high.nil? || current.to_i >= high.to_i)
        high = current #Set new high value
      end
      if (low.nil? || current.to_i <= low.to_i)
        low = current #Set new low value
      end
      current = "" #Set current to empty string in preparation for next number in input string
    elsif c == nums[-1] #Needed an extra check to see if we're at the end of the input string. If so, update current and perform check
      current = current + c
      if (high.nil? || current.to_i >= high.to_i)
        high = current
      end
      if (low.nil? || current.to_i <= low.to_i)
        low = current
      end
    else #C is not a space, so it must be a negative sign or integer, therefore update value of current and continue iteration
      current = current + c
    end
    #Debug output
    puts "current:#{current} high:#{high} low:#{low}"
  end
  #return solution
  return "#{high} #{low}"
end

#Test case
high_and_low("1 2 3 4")

=begin
So after seeing example solutions, this solution is EXTREMELY VERBOSE. Some better, more RUBY solutions

def high_and_low(numbers)
	numbers.split.map(&:to_i).minmax.reverse.join(' ')
end

def high_and_low(numbers)
  numbers = numbers.split(' ')
  min = numbers[0].to_i
  max = numbers[0].to_i
  numbers.each do |x|
    min = x.to_i if min > x.to_i
    max = x.to_i if max < x.to_is
  end
  "#{max} #{min}"
end

def high_and_low(numbers)
  nums = numbers.split(' ')
  max, min = nums.minmax { |a,b| b.to_i <=> a.to_i }
  "#{max} #{min}"
end

=end